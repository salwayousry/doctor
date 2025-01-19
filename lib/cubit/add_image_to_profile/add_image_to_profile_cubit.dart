import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api/end_points.dart';
import '../../models/add_image_model.dart';
import '../user_profile_cubit/user_profile_cubit.dart';
import 'add_image_to_profile_state.dart';

class AddImageToProfileCubit extends Cubit<AddImageToProfileState> {
  AddImageToProfileCubit() : super(AddImageToProfileInitial());


  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(BuildContext context, String id) async {
    print(id);

    PermissionStatus status = await Permission.photos.request();
    if (status.isGranted) {
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        emit(AddImageToProfileImageSelected(imageFile!));
        addImageToProfile(context, imageFile!, id);
      } else {
        emit(AddImageToProfileFailure('No image selected'));
      }
    } else {
      emit(AddImageToProfileFailure('Gallery permission denied'));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gallery permission is required to pick an image.')),
      );
    }
  }

  Future<void> addImageToProfile(BuildContext context, File image, String id) async {
    print("ID: $id");
    print("Image Path: ${image.path}");
    emit(AddImageToProfileLoading());

    try {
      // Ensure the file is a valid JPEG
      if (!image.path.toLowerCase().endsWith(".jpeg") && !image.path.toLowerCase().endsWith(".jpg")) {
        throw Exception("Invalid file format. Please select a JPEG file.");
      }

      final dio = Dio(
        BaseOptions(
          baseUrl: EndPoint.baseUrl,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      FormData formData = FormData.fromMap({
        "Image": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType("image", "jpeg"), // Set MIME type explicitly
        ),
      });

      final response = await dio.patch(
        "/beneficiaries/addImage/$id",
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        await BlocProvider.of<UserProfileCubit>(context).getUserProfile(context, id);
        final addImageModel = AddImageModel.fromJson(response.data);
        emit(AddImageToProfileSuccess(addImageModel.message ?? "Image uploaded successfully!"));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(addImageModel.message ?? "Image uploaded successfully!")),
        );
      } else {
        final addImageModel = AddImageModel.fromJson(response.data);
        emit(AddImageToProfileFailure(addImageModel.message ?? "Error uploading image."));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(addImageModel.message ?? "Error uploading image.")),
        );
      }
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.response?.data}");
        print("DioError Status Code: ${e.response?.statusCode}");
      }
      emit(AddImageToProfileFailure('Unexpected error: $e'));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error: $e')),
      );
    }
  }




}

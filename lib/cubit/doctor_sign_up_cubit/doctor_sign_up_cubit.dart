import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/user_repository.dart';
import '../../core/constants.dart';
import '../../models/doctor.dart';
import 'doctor_sign_up_state.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.userRepository) : super(SignUpInitial());

  final UserRepository userRepository;

  // GlobalKey<FormState> signUpFormKey = GlobalKey();

  // TextEditingController firstNameController = TextEditingController();
  // TextEditingController lastNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController nationalityController = TextEditingController();
  // TextEditingController homeAddressController = TextEditingController();
  // TextEditingController workAddressController = TextEditingController();
  // TextEditingController workController = TextEditingController();

  // bool obSecureText = true;

  Future<void> signUp(Doctor doctor) async {
    try {
      // Emit loading state
      emit(SignUpLoading());

      log("Sign-up is loading...");

      var url = Uri.parse(apiUrl + registerSpecialistEndPoint);

      var request = http.MultipartRequest('POST', url);

      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
      };
      request.headers.addAll(headers);

      // Add form fields
      request.fields.addAll({
        'firstName': doctor.firstName,
        'lastName': doctor.lastName,
        'email': doctor.email,
        'phone': doctor.phone,
        'password': doctor.password,
        'nationality': doctor.nationality,
        'work': doctor.work,
        'yearsExperience': doctor.yearOfExperience.toString(),
        'workAddress': doctor.workAddress,
        'homeAddress': doctor.homeAddress,
        'bio': doctor.bio,
        'sessionPrice': doctor.sessionPrice,
        'sessionDuration': doctor.sessionDuration,
        'specialties': doctor.specialties,
      });

      // Add files if they exist
      if (doctor.idOrPassport != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'idOrPassport',
          doctor.idOrPassport!.path!,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      if (doctor.resume != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'resume',
          doctor.resume!.path!,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      if (doctor.certificates != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'certificates',
          doctor.certificates!.path!,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      if (doctor.ministryLicense != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'ministryLicense',
          doctor.ministryLicense!.path!,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      if (doctor.associationMembership != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'associationMembership',
          doctor.associationMembership!.path!,
          contentType: MediaType('application', 'pdf'),
        ));
      }

      // Send request
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseData = await response.stream.bytesToString();
        log("Success: $responseData");
        emit(SignUpSuccess(message: "Doctor registered successfully!"));
      } else {
        var errorDetails = await response.stream.bytesToString();
        log("Failure: ${response.statusCode} - $errorDetails");
        emit(SignUpFailure(
            errMessage: 'Failed to register doctor: ${response.statusCode}'));
      }
    } catch (e) {
      print("Error occurred: $e");
      emit(SignUpFailure(errMessage: "An error occurred: $e"));
    }
  }

//   signUp() async {
//     try {
//       emit(SignUpLoading());
//       final response = await userRepository.signUp(
//           firstname: firstNameController.text,
//           lastname: lastNameController.text,
//           email: emailController.text,
//           password: passwordController.text,
//           phone: phoneController.text,
//           nationality: nationalityController.text,
//           homeAddress: homeAddressController.text,
//           workAddress: workAddressController.text,
//           filePath: 'files'

//       );

//       response.fold(
//             (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
//             (signUpModel) => emit(SignUpSuccess(message: signUpModel.message),

//         ),
//       );
//     } catch (e) {
//       emit(SignUpFailure(errMessage: 'An error occurred: $e'));
//     }
//   }
// }
}

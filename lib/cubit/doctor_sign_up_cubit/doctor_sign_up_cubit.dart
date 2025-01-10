import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/user_repository.dart';
import 'doctor_sign_up_state.dart';



class SignUpCubit extends Cubit<SignUpStateState> {

  SignUpCubit(this.userRepository) : super(SignUpInitial());

  final UserRepository userRepository;

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController workAddressController = TextEditingController();
  TextEditingController workController = TextEditingController();


  bool obSecureText = true;


  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await userRepository.signUp(
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phone: phoneController.text,
          nationality: nationalityController.text,
          homeAddress: homeAddressController.text,
          workAddress: workAddressController.text,
          filePath: 'files'

      );



      response.fold(
            (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
            (signUpModel) => emit(SignUpSuccess(message: signUpModel.message),

        ),
      );
    } catch (e) {
      emit(SignUpFailure(errMessage: 'An error occurred: $e'));
    }
  }
}

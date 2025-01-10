import 'package:dio/dio.dart';
import 'package:doctor/screens/sign_up_as_doctor_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/dio_consumer.dart';
import '../api/user_repository.dart';
import '../cubit/doctor_sign_up_cubit/doctor_sign_up_cubit.dart';


class SignUpAsDoctorFirstScreen extends StatelessWidget {
  const SignUpAsDoctorFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignUpCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: context.read<SignUpCubit>().signUpFormKey,

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top description
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "انضم إلى فريقنا من الخبراء وابدأ في تقديم استشارات المرضى بكل خصوصية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Form fields
                  _buildTextField("الاسم الاول", controller: context.read<SignUpCubit>().firstNameController),
                  const SizedBox(height: 16),
                  _buildTextField("اسم العائله", controller: context.read<SignUpCubit>().lastNameController),
                  const SizedBox(height: 16),
                  _buildTextField("البريد الإلكتروني", icon: Icons.mail, controller: context.read<SignUpCubit>().emailController),
                  const SizedBox(height: 16),
                  _buildTextField("كلمة المرور", icon: Icons.remove_red_eye, controller: context.read<SignUpCubit>().passwordController),
                  const SizedBox(height: 16),
                  _buildTextField("تأكيد كلمة المرور", icon: Icons.remove_red_eye, controller: context.read<SignUpCubit>().confirmPasswordController),
                  const SizedBox(height: 16),
                  _buildTextField("رقم الهاتف", icon: Icons.phone_android, controller: context.read<SignUpCubit>().phoneController),
                  const SizedBox(height: 32),
                  // Next button
                  InkWell(
                    onTap: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const SignUpAsDoctorSecondScreen()));

                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff19649E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'التالي',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }


  Widget _buildTextField(String label, {IconData? icon, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff19649E),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon:
              icon != null
                  ? Icon(
                icon,
                color: Colors.grey,
              )
                  : null,

            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/reset_password_cubit/reset_password_cubit.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;
  const NewPasswordPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
    TextEditingController();
    return BlocProvider(
        create: (_) => ResetPasswordCubit(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      'assets/images/newpassword.png',
                      height: 330,
                      width: 550,
                      fit: BoxFit
                          .contain, // Ensures the image scales properly within the bounds
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'كلمه المرور الجديده',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF19649E),
                      ),
                    ),
                    const SizedBox(height: 30),
                    buildTextField(
                      validation: (String? value) {
                        value = passwordController.text;
                        if (value == null || value.length < 6) {
                          return "يجب أن تكون كلمة المرور 6 أحرف على الأقل";
                        }
                        return null;
                      },
                      controller: passwordController,
                      label: 'كلمه المرور الجديده',
                      icon: Icons.visibility_off,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      validation: (String? value) {
                        value = passwordController.text;
                        if (value != confirmPasswordController.text) {
                          return "كلمتا المرور غير متطابقتين";
                        }
                        return null;
                      },
                      label: 'تأكيد كلمه المرور',
                      icon: Icons.visibility_off,
                      isPassword: true,
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<ResetPasswordCubit>(context)
                              .resetPasswordByEmail(context, email,
                              passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF19649E),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'تأكيد',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    required FormFieldValidator<String> validation,
  }) {
    return TextFormField(
      validator: validation,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textAlign: TextAlign.right,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor/widgets/custom_text_field_for_sign_up.dart';
import 'package:doctor/make_email/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homescreen.dart';

// صفحة تسجيل المستخدم
class SignUpAsClient extends StatelessWidget {
  SignUpAsClient({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  // حفظ اسم المستخدم في SharedPreferences
  Future<void> _saveUserName(String firstName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', '$firstName');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<SignUpCubit, SignUpStateClient>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    _saveUserName(firstNameController.text);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else if (state is SignUpError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  final cubit = context.read<SignUpCubit>();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "اكتشف أخصائي الصحة النفسية والجسدية واحجز مواعيدك بسهولة",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: "الاسم الأول",
                        suffixIcon: Icons.person,
                        controller: firstNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال الاسم الأول' : null,
                      ),
                      CustomTextField(
                        label: "اسم العائلة",
                        suffixIcon: Icons.family_restroom,
                        controller: lastNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال اسم العائلة' : null,
                      ),
                      CustomTextField(
                        label: "البريد الإلكتروني",
                        suffixIcon: Icons.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value!.isEmpty
                            ? 'يرجى إدخال البريد الإلكتروني'
                            : null,
                      ),
                      CustomTextField(
                        label: "كلمة المرور",
                        suffixIcon: Icons.remove_red_eye_outlined,
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          } else if (value.length < 8) {
                            return 'يجب أن تكون كلمة المرور على الأقل 8 أحرف';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        label: "رقم الهاتف",
                        suffixIcon: Icons.phone_android,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال رقم الهاتف' : null,
                      ),
                      CustomTextField(
                        label: "العمر",
                        suffixIcon: Icons.cake,
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          final age = int.tryParse(value!);
                          return (age == null || age <= 18)
                              ? 'يجب أن يكون العمر أكبر من 18'
                              : null;
                        },
                      ),
                      CustomTextField(
                        label: "الجنسية",
                        suffixIcon: Icons.flag,
                        controller: nationalityController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال الجنسية' : null,
                      ),
                      CustomTextField(
                        label: "عنوان المنزل",
                        suffixIcon: Icons.home,
                        controller: addressController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال عنوان المنزل' : null,
                      ),
                      CustomTextField(
                        label: "المنطقة",
                        suffixIcon: Icons.location_on,
                        controller: regionController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال المنطقة' : null,
                      ),
                      CustomTextField(
                        label: "المهنة",
                        suffixIcon: Icons.work,
                        controller: professionController,
                        validator: (value) =>
                            value!.isEmpty ? 'يرجى إدخال المهنة' : null,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.registerUser(
                              //
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                              profession: professionController.text,
                              homeAddress: addressController.text,
                              age: int.tryParse(ageController.text) ?? 0,
                              region: regionController.text,
                              nationality: nationalityController.text,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff19649E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(31),
                          ),
                        ),
                        child: state is SignUpLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: const Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                color: Color(0xFF007BFF),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Text(
                            'لديك حساب بالفعل؟',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// الكلاس الخاص بـ Cubit لتسجيل المستخدم
class SignUpCubit extends Cubit<SignUpStateClient> {
  final BuildContext context;

  SignUpCubit(this.context) : super(SignUpInitial());

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String profession,
    required String homeAddress,
    required int age,
    required String region,
    required String nationality,
  }) async {
    emit(SignUpLoading());
    final String url =
        "https://scopey.onrender.com/api/auth/register/beneficiary";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "phone": phone,
          "profession": profession,
          "homeAddress": homeAddress,
          "age": age,
          "region": region,
          "nationality": nationality,
        }),
      );

      if (response.statusCode == 201) {
        // تحليل الاستجابة كنص عادي
        final responseString = response.body;
        print("Response: $responseString"); // طباعة الاستجابة
        emit(SignUpSuccess(responseString)); // مرّر النص العادي
      } else {
        // إذا كان هناك خطأ في الاستجابة
        final error = jsonDecode(response.body)["error"] ?? "حدث خطأ غير متوقع";
        emit(SignUpError(error));
      }
    } catch (e) {
      emit(SignUpError("فشل الاتصال بالسيرفر: $e"));
    }
  }
}

// حالات تسجيل المستخدم
abstract class SignUpStateClient {}

class SignUpInitial extends SignUpStateClient {}

class SignUpLoading extends SignUpStateClient {}

class SignUpSuccess extends SignUpStateClient {
  final String message;
  SignUpSuccess(this.message);
}

class SignUpError extends SignUpStateClient {
  final String error;
  SignUpError(this.error);
}

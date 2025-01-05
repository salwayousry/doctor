import 'package:doctor/make_email/login.dart';
import 'package:doctor/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor/widgets/custom_text_field_for_sign_up.dart';
import '../core/validators.dart';

class SignUpAsClient extends StatelessWidget {
  SignUpAsClient({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "اكتشف أخصائي الصحة النفسية والجسدية واحجز مواعيدك بسهولة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "الاسم الاول",
                  suffixIcon: Icons.person,
                  controller: firstNameController,
                  validator: (value) => validateName(value, "الاسم الأول"),
                ),
                CustomTextField(
                  label: "اسم العائلة",
                  suffixIcon: Icons.family_restroom,
                  controller: lastNameController,
                  validator: (value) => validateName(value, "اسم العائلة"),
                ),
                CustomTextField(
                  label: "الايميل",
                  suffixIcon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => validateEmail(value),
                ),
                CustomTextField(
                  label: "كلمة المرور",
                  suffixIcon: Icons.remove_red_eye_outlined,
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) => validatePassword(value),
                ),
                CustomTextField(
                  label: "تاكيد كلمة المرور",
                  suffixIcon: Icons.remove_red_eye_outlined,
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) =>
                      validateConfirmPassword(value, passwordController.text),
                ),
                CustomTextField(
                  label: "رقم الهاتف",
                  suffixIcon: Icons.phone_android,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) => validatePhone(value),
                ),
                CustomTextField(
                  label: "العمر",
                  suffixIcon: Icons.calendar_month,
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) => validateAge(value),
                ),
                CustomTextField(
                  label: "الجنس",
                  suffixIcon: Icons.transgender_sharp,
                  controller: genderController,
                  validator: (value) => validateName(value, "الجنس"),
                ),
                CustomTextField(
                  label: "الجنسية",
                  suffixIcon: Icons.flag,
                  controller: nationalityController,
                  validator: (value) => validateName(value, "الجنسية"),
                ),
                CustomTextField(
                  label: "عنوان السكن",
                  suffixIcon: Icons.add_location_alt,
                  controller: addressController,
                  validator: (value) => validateName(value, "عنوان السكن"),
                ),
                CustomTextField(
                  label: "المنطقة",
                  suffixIcon: Icons.location_city,
                  controller: regionController,
                  validator: (value) => validateName(value, "المنطقة"),
                ),
                CustomTextField(
                  label: "المهنة",
                  suffixIcon: Icons.work,
                  controller: professionController,
                  validator: (value) => validateName(value, "المهنة"),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => const LoginScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff19649E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'انشاء حساب',
                      style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w700),
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
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style:
                            TextStyle(color: Color(0xFF007BFF), fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

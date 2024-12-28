import 'package:doctor/screens/sign_up_as_doctor_second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpAsDoctorFirstScreen extends StatelessWidget {
  const SignUpAsDoctorFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
              SizedBox(height: 32),
              // Form fields
              _buildTextField("الاسم الاول"),
              SizedBox(height: 16),
              _buildTextField("اسم العائله"),
              SizedBox(height: 16),
              _buildTextField("البريد الإلكتروني", icon: Icons.mail),
              SizedBox(height: 16),
              _buildTextField("كلمة المرور", icon: Icons.remove_red_eye),
              SizedBox(height: 16),
              _buildTextField("تأكيد كلمة المرور", icon: Icons.remove_red_eye),
              SizedBox(height: 16),
              _buildTextField("رقم الهاتف", icon: Icons.phone_android),
              SizedBox(height: 32),
              // Next button
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const SignUpAsDoctorSecondScreen()),
                  );
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
    );
  }

  Widget _buildTextField(String label, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
              prefixIcon: icon != null
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

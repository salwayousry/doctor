
import 'package:doctor/make_email/reset_password.dart';
import 'package:doctor/make_email/verify_email.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'مرحباً بعودتك',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/img.png',
                      height: 150,
                    ),
                    const Text(
                      'Wellbeing Day',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'THERAPY. RELAX. MAGAZINE',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              buildTextField(
                context,
                label: 'الإيميل',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              buildTextField(
                context,
                label: 'الباسورد',
                icon: Icons.visibility_off_outlined,
                isPassword: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetPassword()),
                    );
                  },
                  child: const Text(
                    'هل نسيت الباسورد؟',
                    style: TextStyle(color:  Color(0xff19649E)),
                  ),
                ),
              ),
              buildTextField(
                context,
                label: 'التليفون',
                icon: Icons.phone,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle login
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff19649E),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text(
                    'إنشاء حساب جديد',
                    style: TextStyle( fontSize: 16,
                      color: Color(0xFF007BFF),
                      fontWeight: FontWeight.w700,),
                  ),

                  TextButton(
                    onPressed: () {
                      // Handle create account
                    },
                    child:  Text('ليس لديك حساب؟',style: TextStyle( fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context,
      {required String label, required IconData icon, bool isPassword = false}) {
    return TextField(
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
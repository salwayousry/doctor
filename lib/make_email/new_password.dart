import 'package:flutter/material.dart';

class NewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/newpassword.png',
                height: 330,
                width: 550,
                fit: BoxFit.contain, // Ensures the image scales properly within the bounds
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
                label: 'كلمه المرور الجديده',
                icon: Icons.visibility_off,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              buildTextField(
                label: 'تأكيد كلمه المرور',
                icon: Icons.visibility_off,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle confirmation
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
    );
  }

  Widget buildTextField({
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
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

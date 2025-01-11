import 'package:doctor/screens/sign_up_as_client.dart';
import 'package:doctor/screens/sign_up_as_doctor_first_screen.dart';
import 'package:flutter/material.dart';

import '../make_email/login.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // استخدام Center لمحاذاة العناصر في منتصف الصفحة
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // إضافة اللوجو بحجم 180x142.89
              Image.asset(
                'assets/images/img.png',
                width: 180, // تحديد العرض
                height: 142.89, // تحديد الارتفاع
              ),
              const SizedBox(height: 20),
              const Text(
                'اختر نوع حسابك',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'هل ستجعل تجربتك أسهل',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // تعديل الأزرار لتكون متطابقة مع التصميم
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpAsClient()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff19649E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // زوايا دائرية
                  ),
                ),
                child: Container(
                  width: double.infinity, // ملء العرض
                  height: 52, // ارتفاع الزر
                  alignment: Alignment.center, // مركز النص
                  child: const Text(
                    'متابعة كمستفيد',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700), // حجم النص
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpAsDoctorFirstScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff19649E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Container(
                  width: double.infinity, // ملء العرض
                  height: 52, // ارتفاع الزر
                  alignment: Alignment.center, // مركز النص
                  child: const Text(
                    'متابعة كأخصائي',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700), // حجم النص
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 40),
              // الجزء السفلي مع ترتيب النص وزر تسجيل الدخول
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          color: Color(0xff19649E),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:doctor/make_email/login.dart';
import 'package:doctor/screens/sign_up_as_doctor_first_screen.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // استخدام Center لمحاذاة العناصر في منتصف الصفحة
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
              SizedBox(height: 20),
              Text(
                'اختر نوع حسابك',
                style: TextStyle( fontSize: 24,fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'هل ستستمتع تجربتك أسهل',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // تعديل الأزرار لتكون متطابقة مع التصميم
              ElevatedButton(
                onPressed: () {
                 // أضف الوظيفة المناسبة هنا
                },
                child: Container(
                  width: double.infinity, // ملء العرض
                  height: 52, // ارتفاع الزر
                  alignment: Alignment.center, // مركز النص
                  child: Text(
                    'متابعة كمستفيد',
                    style: TextStyle( fontSize: 18,fontWeight: FontWeight.w700), // حجم النص
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff19649E), // لون الزر
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // زوايا دائرية
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>SignUpAsDoctorFirstScreen()),
                  );
                },
                child: Container(
                  width: double.infinity, // ملء العرض
                  height: 52, // ارتفاع الزر
                  alignment: Alignment.center, // مركز النص
                  child: Text(
                    'متابعة كأخصائي',
                    style: TextStyle( fontSize: 18,fontWeight: FontWeight.w700), // حجم النص
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff19649E), // لون الزر
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: double.infinity, // ملء العرض
                  height: 52, // ارتفاع الزر
                  alignment: Alignment.center, // مركز النص
                  child: Text(
                    'متابعة كضيف',
                    style: TextStyle( fontSize: 18,fontWeight: FontWeight.w700), // حجم النص
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff19649E), // لون الزر
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              // الجزء السفلي مع ترتيب النص وزر تسجيل الدخول
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>LoginPage()),
                      ); // هنا يمكنك إضافة وظيفة تسجيل الدخول
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(color: Color(0xff19649E), fontSize: 16,fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
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
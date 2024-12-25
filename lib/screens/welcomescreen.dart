import 'package:doctor/screens/secondpage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // زر "تخطي" في أعلى الشاشة
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    color: Color(0xff19649E),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            // مسافة فارغة لتوسيط المحتوى في النصف السفلي
            Spacer(flex: 2),

            // الصورة والنصوص في النصف السفلي
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // صورة الطبيب
                  Image.asset(
                    'assets/images/doctor.png', // أضف مسار الصورة الصحيح
                    height: 200,
                  ),

                  SizedBox(height: 24.0),

                  // نص الترحيب
                  Text(
                    'أهلًا',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // النص الوصفي
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'أحيانًا، الخطوة الأولى هي الأصعب. لكن مع تطبيقنا، '
                          'تبدأ بالسفر نحو الدعم النفسي والشخصي والراحة بخطوات بسيطة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),

                  SizedBox(height: 24.0),

                  // زر الانتقال للصفحة التالية
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xff19649E), width: 2),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xff19649E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // مسافة فارغة بين النصف السفلي والنهاية
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

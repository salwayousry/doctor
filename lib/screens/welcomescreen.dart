import 'package:doctor/screens/secondpage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // زر "تخطي" في أعلى الشاشة
            const Padding(
              padding: EdgeInsets.only(top: 10.0, right: 16.0),
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
            const Spacer(flex: 2),

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

                  const SizedBox(height: 24.0),

                  // نص الترحيب
                  const Text(
                    'أهلًا',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // النص الوصفي
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
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

                  const SizedBox(height: 24.0),

                  // زر الانتقال للصفحة التالية
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondPage()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff19649E), width: 2),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff19649E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // مسافة فارغة بين النصف السفلي والنهاية
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:doctor/screens/thirdpage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // محتوى الصفحة
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // الصورة
                  Image.asset(
                    'assets/images/welcome.png', // أضف مسار الصورة هنا
                    height: 200,
                  ),

                  SizedBox(height: 24.0),

                  // النص الرئيسي
                  Text(
                    'سَهِّل على نفسك',
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
                      'معنا، لن تضطر للانتظار. احجز موعدك في أي وقت يناسبك، '
                          'بسرعة وسلاسة، وبدون أي قلق',
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
                        MaterialPageRoute(builder: (context) => ThirdPage()),
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

            // زر التخطي
            Positioned(
              top: 16.0,
              right: 16.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );  // Add functionality for skip if needed
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    color: Color(0xFF007BFF),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

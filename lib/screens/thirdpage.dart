import 'package:doctor/screens/selectionpage.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // توسيط العناصر عموديًا
            children: [
              // صورة الطبيب
              Image.asset(
                'assets/images/welcometwo.png', // أضف مسار الصورة الصحيح
                height: 200,
              ),

              const SizedBox(height: 24.0),

              // النص الرئيسي
              const Text(
                'اختر الأخصائي الذي يفهمك',
                style: TextStyle(
                  fontSize: 20.0, // حجم الخط أصغر لتناسب التصميم
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12.0),

              // النص الوصفي
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'نؤمن بمتطلباتك الأساسية الفريدة. لذلك، وفرنا لك '
                      'أفضل مختصي الصحة النفسية والجسدية لاختيارهم بسهولة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0, // حجم الخط
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // زر البدء
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SelectionPage()),
                  );  // أضف الوظيفة المناسبة هنا
                },
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff19649E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'ابدأ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
}

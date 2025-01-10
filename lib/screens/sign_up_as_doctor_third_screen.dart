import 'package:doctor/screens/sign_up_as_doctor_fourth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpAsDoctorThirdScreen extends StatefulWidget {
  const SignUpAsDoctorThirdScreen({super.key});

  @override
  State<SignUpAsDoctorThirdScreen> createState() => _SignUpAsDoctorThirdScreenState();
}

class _SignUpAsDoctorThirdScreenState extends State<SignUpAsDoctorThirdScreen> {


  final Map<String, Map<String, bool>> _categories = {

  'صحة نفسية': {
    'اضطرابات نفسية': false,
    'برامج علاجية': false,
    'علاج جماعي': false,
    'اضطراب الاطفال': false,
    'حل مشاكل': false,
    'ارشاد وتوجيه': false,
    'وقاية ومتابعة نفسية': false,
    'إعادة تأهيل ودعم': false,
  },

  'تطوير مهارات': {
    'الاسترخاء': false,
    'تحمل الضغوط': false,
    'ضبط المشاعر': false,
    'حل استراتيجيات جدلية': false,
    'تحقيق التوازن': false,
    'تحسين الثقة': false,
    'تحقيق الأهداف': false,
    'تحقيق النجاح': false,
    'اضطراب الصدمة': false,
  },

  'اضطراب نفسي': {
    'القلق': false,
    'الاكتئاب': false,
    'الرهاب': false,
    'الوسواس': false,
    'اضطراب جنسي': false,
    'اضطراب الاكل': false,
    'اضطراب شخصي': false,
    'الإدمان': false,
    'اضطراب الصدمة': false,
  },

  'صحة جسدية': {
    'نظام غذائي': false,
    'نظام رياضي': false,
    'عناية صحية': false,
    'فحوص دورية': false,
  }
  };


  @override
  Widget build(BuildContext context) {

    final rightColumnCategories = [
      'اضطراب نفسي',
      'صحة جسدية',
    ];
    final leftColumnCategories = [
      'صحة نفسية',
      'تطوير مهارات',
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child:
          Column(

            children: [
              const Text("اختار تخصصك", textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff19649E),
                    fontWeight: FontWeight.bold,)),
              const SizedBox(height: 20,),

              Expanded(
                child:
                ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Right Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: rightColumnCategories
                                .map((category) =>
                                buildCategory(category, _categories[category]!))
                                .toList(),
                          ),
                        ),
                        // Left Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: leftColumnCategories
                                .map((category) =>
                                buildCategory(category, _categories[category]!))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    },
              child: Container(
                width: Get.width * 0.3,
                height: Get.height * 0.07,
                decoration: BoxDecoration(
                  color: const Color(0xff19649E),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: const Center(
                  child: Text(
                    'رجوع',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
                    ),

                    InkWell(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const SignUpAsDoctorFourth()),
                );
              },
              child: Container(
                width: Get.width * 0.3,
                height: Get.height * 0.07,
                decoration: BoxDecoration(
                  color: const Color(0xff19649E),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: const Center(
                  child: Text(
                    'التالي',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
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
  Widget buildCategory(String category, Map<String, bool> subcategories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category,
            style: const TextStyle(color: Color(0xff19649E), fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ),
        // Subcategories
        Column(
          children: subcategories.entries.map((entry) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(

                  activeColor: Colors.blue,
                  value: entry.value,
                  onChanged: (newValue) {
                    setState(() {
                      subcategories[entry.key] = newValue!;
                    });
                  },
                ),
                Text(entry.key, textAlign: TextAlign.right, style: const TextStyle(fontSize: 16),),

              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}




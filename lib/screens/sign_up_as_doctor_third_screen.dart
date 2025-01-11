import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../cubit/doctor_sign_up_cubit/doctor_sign_up_cubit.dart';
import '../make_email/login.dart';
import '../models/doctor.dart';

class SignUpAsDoctorThirdScreen extends StatefulWidget {
  final Doctor doctor;

  // Constructor to accept the Doctor object
  const SignUpAsDoctorThirdScreen({Key? key, required this.doctor})
      : super(key: key);
  @override
  State<SignUpAsDoctorThirdScreen> createState() =>
      _SignUpAsDoctorThirdScreenState();
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

  final List<String> rightColumnCategories = [
    'اضطراب نفسي',
    'صحة جسدية',
  ];
  final List<String> leftColumnCategories = [
    'صحة نفسية',
    'تطوير مهارات',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "اختار تخصصك",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff19649E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Right Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: rightColumnCategories
                                .map((category) => buildCategory(
                                    category, _categories[category]!))
                                .toList(),
                          ),
                        ),
                        // Left Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: leftColumnCategories
                                .map((category) => buildCategory(
                                    category, _categories[category]!))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () {
                  // context.read<SignUpCubit>().signUp();
                  String selectedSpecialities = getSelectedSpecialities();

                  // Set the speciality of the doctor
                  widget.doctor.specialties = selectedSpecialities;
                  context.read<SignUpCubit>().SignUp(widget.doctor);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xff19649E),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(
                    child: Text(
                      'انشاء حساب',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لديك حساب بالفعل ؟ ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff19649E),
                        fontWeight: FontWeight.w700,
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

  String getSelectedSpecialities() {
    List<String> selectedCategories = [];

    _categories.forEach((category, subcategories) {
      subcategories.forEach((subcategory, isSelected) {
        if (isSelected) {
          selectedCategories.add(subcategory);
        }
      });
    });

    return selectedCategories.join('; ');
  }

  Widget buildCategory(String category, Map<String, bool> subcategories) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category,
            style: TextStyle(
              color: Color(0xff19649E),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
        ),
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
                Text(
                  entry.key,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:doctor/make_email/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpAsDoctorThirdScreen extends StatelessWidget {
  const SignUpAsDoctorThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: SizedBox(
          height: Get.height * 0.91,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "صورة الهويه/ الباسبور",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff19649E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "الشهادات",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff19649E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "ترخيص أو إذن مزاولة المهنة",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff19649E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "عضوية النقابه أو الجمعيه",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff19649E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Center(
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.08),
              InkWell(
                onTap: (){},
                child: Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.07,
                  decoration: BoxDecoration(
                    color: const Color(0xff19649E),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Center(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const LoginPage()),
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF007BFF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Text(
                    'لديك حساب بالفعل ؟ ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

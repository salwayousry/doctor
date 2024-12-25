import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpAsDoctorThirdScreen extends StatelessWidget {
  const SignUpAsDoctorThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 15,left: 15),
        child: Container(
          height: Get.height * 0.91,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
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
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
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
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
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
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
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
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.upload, size: 30),
                              color: Colors.grey),
                        ),
                        style: TextStyle(color: Colors.black),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff19649E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
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

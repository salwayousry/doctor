import 'package:doctor/make_email/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';



class VerifyScreenPhone extends StatefulWidget {
  const VerifyScreenPhone({super.key});

  @override
  State<VerifyScreenPhone> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreenPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
            child: ListView(children: [
              Image.asset("assets/images/verify.png"),
              const Text(
                "التحقق من الرمز",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19649E)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "الرجاء إدخال الرمز الذي أرسلناه للتو إلى التليفون",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 50,),

              OtpTextField(
                enabledBorderColor: const Color(0xFF19649E),
                numberOfFields: 5,
                showFieldAsBox: false,
                onCodeChanged: (String code) {

                },
              ),


              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("إعادة إرسال الرمز",
                          style: TextStyle(color: Color(0xFF19649E), fontWeight: FontWeight.bold, fontSize: 18))),
                  const Text("لم تتلق الرمز؟",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold
                      )),
                ],
              ),
              const SizedBox(height: 20,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff19649E),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10))),
                  onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>const NewPasswordPage(email: widget.email,)),
                    // );
                  }, child: const Text("التحقق", style: TextStyle(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)),

            ]))

    );
  }
}

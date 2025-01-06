import 'package:doctor/make_email/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../cubit/verify_code_cubit/verify_code_cubit.dart';


class VerifyScreenEmail extends StatefulWidget {
  final String email;
  const VerifyScreenEmail({super.key,required this.email});

  @override
  State<VerifyScreenEmail> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreenEmail> {
  final TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => VerifyCodeCubit(),
    child: Scaffold(
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
                "الرجاء إدخال الرمز الذي أرسلناه للتو إلى الإيميل",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 50,),

              OtpTextField(
                enabledBorderColor: const Color(0xFF19649E),
                numberOfFields: 6,
                showFieldAsBox: false,
                onCodeChanged: (String code) {

                },
                onSubmit: (String code){
                  codeController.text= code;
                },
              ),


              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {

                      },
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
                    final code = int.tryParse(codeController.text);
                    print(codeController.text);
                    BlocProvider.of<VerifyCodeCubit>(context)
                        .verifyCodeByEmail(context,widget.email,code??0);
                  }, child: const Text("التحقق", style: TextStyle(
                  fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),)),

            ]))

    ));
  }
}

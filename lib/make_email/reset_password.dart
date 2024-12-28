import 'package:doctor/make_email/verify_email.dart';
import 'package:doctor/make_email/verify_phone.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  int _currentPage = 0;
  final int totalPages = 2;

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
        child: ListView(children: [
          Image.asset("assets/images/lock.png",),
          const Text(
            "إعادة تعيين كلمة المرور",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF19649E)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),

          Container(

            decoration: BoxDecoration(
              color: const Color(0xFF19649E),
              borderRadius: BorderRadius.circular(10), // Circular shape
            ),
            child: NavigationBar(
              backgroundColor: Colors.transparent,
              height: 50,
              destinations: [
                TextButton(
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor:
                    _currentPage == 0 ? Colors.white : Colors.transparent,
                  ),
                  child: Text(
                    'رقم التليفون',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: _currentPage == 0
                          ? const Color(0xFF19649E)
                          : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor:
                    _currentPage == 1 ? Colors.white : Colors.transparent,
                  ),
                  child: Text(
                    'الإيميل',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: _currentPage == 1
                            ? const Color(0xFF19649E)
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          <Widget>[
            //   'رقم التليفون' page

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "رقم التليفون",
                  style: TextStyle(fontSize: 20, color: Color(0xFF19649E)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 10, color: Color(0xFF19649E)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon:
                      const Icon(Icons.mobile_screen_share_outlined),
                      hintText: "رقم التليفون",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'من فضلك ادخل رقم التليفون';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyScreenPhone()));

                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(700, 50),
                        primary: Color(0xff19649E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "إرسال",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),

            //   'رقم الايميل' page
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "الإيميل",
                  style: TextStyle(fontSize: 20, color: Color(0xFF19649E)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: TextFormField(
                    // controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "الإيميل",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك ادخل الإيميل';
                        }
                        return null;
                      }),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyScreenEmail()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(700, 50),
                        primary: Color(0xff19649E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "إرسال",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ][_currentPage],

        ]),
      ),
    );
  }
}

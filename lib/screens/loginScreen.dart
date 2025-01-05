import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            Image(
              image: AssetImage("assets/images/img.png"),
            ),
            Text('LoginScreen'),
          ],
        )),
      ),
    );
  }
}

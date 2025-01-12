import 'package:dio/dio.dart';
import 'package:doctor/screens/client_profile_details.dart';
import 'package:doctor/screens/client_profile_screen.dart';
import 'package:doctor/screens/settings_screen.dart';
import 'package:doctor/screens/splashscreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'api/dio_consumer.dart';
import 'api/user_repository.dart';
import 'cubit/doctor_sign_up_cubit/doctor_sign_up_cubit.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        path: 'assets/translations', // <-- change the path of the translation files
        // fallbackLocale: Locale('en', 'ar'),
        child: BlocProvider(
          create: (context) => SignUpCubit(UserRepository(api: DioConsumer(dio: Dio()))),
          child: const GetMaterialApp(
            home: MyApp(),
          ),
        )),

  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: context.locale, // Default locale
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,

      title: 'doctorapp',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
      home: SplashScreen(),
    );
  }
}


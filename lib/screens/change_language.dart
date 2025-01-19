import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/user_profile_cubit/user_profile_cubit.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {


  late UserProfileCubit userProfileCubit;

  int _currentPage = 0;
  final int totalPages = 2;

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    userProfileCubit = BlocProvider.of<UserProfileCubit>(context); // Initialize the cubit
    _loadUserProfile();

  }


  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('userId') ?? "";

    userProfileCubit.getUserProfile(context, id);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff19649E),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          "changeLanguage".tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: screenWidth,
                height: screenHeight * 0.21, // Adjust height proportionally
                decoration: const BoxDecoration(
                  color: Color(0xff19649E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: screenWidth * 0.3,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image:
                                  AssetImage('assets/images/omar.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 10,
                          left: 10,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor:  Color(0xff19649E),
                            child: Icon(Icons.edit,
                                size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          Text(
            "${userProfileCubit.userData?.firstName}",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: screenWidth * 0.06,
              color: const Color(0xff19649E),
            ),
          ),


          Padding(
            padding: const EdgeInsets.fromLTRB(25, 40, 25, 5),
            child: Column(
              children: [
                Container(
                  height: 50,
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
                          EasyLocalization.of(context)!.setLocale(const Locale('ar'));

                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor:
                          _currentPage == 0 ? Colors.white : Colors.transparent,
                        ),
                        child: Text(
                          "arabic".tr(),
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
                          EasyLocalization.of(context)!.setLocale(const Locale('en'));

                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor:
                          _currentPage == 1 ? Colors.white : Colors.transparent,
                        ),
                        child: Text(
                          "english".tr(),
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
                const SizedBox(height: 150,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(700, 50),
                        backgroundColor: const Color(0xFF19649E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      "update".tr(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

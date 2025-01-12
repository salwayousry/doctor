import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/user_profile_cubit/user_profile_cubit.dart';
import '../cubit/user_profile_cubit/user_profile_state.dart';
import '../models/user_profile_model.dart';
import 'client_profile_screen.dart';
import 'home_third_screen.dart';
import 'homescreen.dart';

class HomeSecondScreen extends StatefulWidget {
  const HomeSecondScreen({super.key});

  @override
  _HomeSecondScreenState createState() => _HomeSecondScreenState();
}

class _HomeSecondScreenState extends State<HomeSecondScreen>
    with SingleTickerProviderStateMixin {
  List<String> categories = ["المجله", "تطوير مهارات", "صحه جسديه", "صحه نفسيه"];
  RxInt selectedIndex = 2.obs;
  final List<String> images = [
    'assets/images/Frame 1000002843.png',
    'assets/images/Frame 1000002840.png',
    'assets/images/Frame 1000002841.png',
  ];
  PageController _pageController = PageController();
  late Timer _timer;
  late UserProfileCubit userProfileCubit;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    userProfileCubit = BlocProvider.of<UserProfileCubit>(context); // Initialize the cubit
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _loadUserProfile();
    _startAutoPageSwitch();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('userId') ?? "";

    // Trigger data fetch and fade-in animation
    userProfileCubit.getUserProfile(context, id);
  }

  void _startAutoPageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page?.toInt() == images.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (_) => userProfileCubit, // Use the same cubit instance
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              // Trigger fade-in animation when loading starts
              _fadeController.forward();
              return Scaffold(body: Center(child: CircularProgressIndicator(),),
              );
            } else if (state is UserProfileFailure) {
              return Center(
                child: Text("Error loading profile: ${state.error}"),
              );
            } else if (state is UserProfileSuccess) {
              UserProfileModel userProfile = state.userProfile;
              // Trigger fade-in animation when data is loaded
              _fadeController.forward();
              return FadeTransition(
                  opacity: _fadeAnimation,
                  child: Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      backgroundColor: Color(0xff19649E),
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.black,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      iconSize: 25,
                      currentIndex: 1,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.person_2_outlined,
                            size: 28,
                          ),
                          label: 'الملف الشخصي',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.dashboard_outlined,
                            size: 28,
                          ),
                          label: 'القائمة',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home_outlined,
                            size: 28,
                          ),
                          label: 'الرئيسية',
                        ),
                      ],
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (_) => UserProfileCubit(),
                                  child: const ClientProfileScreen(),
                                ),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (_) => UserProfileCubit(),
                                  child: const HomeSecondScreen(),
                                ),
                              ),
                            );
                            break;
                          case 2:
                          // Stay on the current screen, no action needed for 'الرئيسية'
                            break;
                        }
                      },
                    ),
                    body: Column(
        children: [
          Container(
            height: screenHeight * 0.2,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_none,
                        color: Color(0xff19649E), size: screenWidth * 0.08),
                    SizedBox(width: 12),
                    Icon(Icons.chat_bubble_outline,
                        color: Color(0xff19649E), size: screenWidth * 0.08),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                  child: Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.25,
                    child: Image.asset(
                      'assets/images/img.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/omar.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 28),
                    Text(
                      '${userProfile.firstName} مرحباً',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff19649E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: 32,
            child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: screenWidth * 0.03);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      selectedIndex.value = index;

                      Widget page;

                      if (selectedIndex.value == 0) {
                        page = HomeScreen();
                      } else if (selectedIndex.value == 1) {
                        page = HomeThirdScreen();
                      } else if (selectedIndex.value == 2) {
                        page = HomeSecondScreen();
                      } else {
                        page = HomeScreen();
                      }
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
                            create: (_) => UserProfileCubit(),
                            child: page,
                          ),
                          transitionDuration: Duration(milliseconds: 1), // Custom animation duration
                        ),
                      );

                    },

                    child: Obx(() {
                    return Container(
                      width: 100,
                      height: 32,
                      decoration: BoxDecoration(
                        color: selectedIndex.value == index
                            ? Color(0xff19649E)
                            : Color(0xffD5D5D5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: selectedIndex.value == index
                                ? Colors.white
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: screenHeight * 0.18,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenWidth * 0.4,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1F78BC),
                ),
                child: Center(
                  child: Text(
                    "إستشاره مجانيه",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.4,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1F78BC),
                ),
                child: Center(
                  child: Text(
                    "جلسه فوريه",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.1),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff69B7F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "عنايه صحيه",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff69B7F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "نظام رياضي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff69B7F3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "نظام غذائي",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                width: 100,
                height: 68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff69B7F3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "نظام غذائي",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
  return Container(); // Default return in case no state matches
},
));
}

}

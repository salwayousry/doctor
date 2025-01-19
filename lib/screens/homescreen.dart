import 'dart:async';
import 'dart:io';
import 'package:doctor/screens/client_profile_screen.dart';
import 'package:doctor/screens/home_second_screen.dart';
import 'package:doctor/screens/homescreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/add_image_to_profile/add_image_to_profile_cubit.dart';
import '../cubit/update_user_cubit/update_user_cubit.dart';
import '../cubit/user_profile_cubit/user_profile_cubit.dart';
import '../cubit/user_profile_cubit/user_profile_state.dart';
import '../models/user_profile_model.dart';
import 'home_third_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "mentalHealth".tr(),
    "physicalHealth".tr(),
    "skillDevelopment".tr(),
    "magazine".tr()
  ];
  int selectedIndex = 0;

  final List<String> images = [
    'assets/images/family.png',
    'assets/images/familyy.png',
    'assets/images/familyyy.png',
  ];
  PageController _pageController = PageController();
  late Timer _timer;
  late UserProfileCubit userProfileCubit;

  @override
  void initState() {
    super.initState();
    userProfileCubit = BlocProvider.of<UserProfileCubit>(context);
    _loadUserProfile();
    _startAutoPageSwitch();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('userId') ?? "";
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

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Return false to disable the back button
        return false;
      },
      child: BlocProvider(
        create: (_) => userProfileCubit,
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is UserProfileFailure) {
              return Center(child: Text("Error loading profile: ${state.error}"));
            } else if (state is UserProfileSuccess) {
              UserProfileModel userProfile = state.userProfile;
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xff19649E),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: 1,
                  iconSize: 25,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined, size: 28),
                      label: "profile".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_outlined, size: 28),
                      label: "menu".tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 28),
                      label: "home".tr(),
                    ),
                  ],
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider<UserProfileCubit>(create: (_) => UserProfileCubit()),
                                BlocProvider<AddImageToProfileCubit>(create: (_) => AddImageToProfileCubit()),
                                BlocProvider<UpdateUserCubit>(create: (_) => UpdateUserCubit()),
                              ],
                              child: const ClientProfileScreen(),
                            ),

                          ),
                              (route) => false,
                        );
                        break;
                      case 1:
                        Navigator.pushReplacement(
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
                    // Header
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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 66,
                                height: 66,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50), // زاوية الإطار
                                  child: userProfile.imageUrl==""||userProfile.imageUrl==null?Image.asset("assets/images/profile.jpg",fit: BoxFit.fill,):Image.network(
                                    userProfile.imageUrl ?? "", // رابط الصورة
                                    fit: BoxFit.fill, // ملء الصورة
                                  ),
                                ),
                              ),
                              SizedBox(width: 28),
                              Text(
                                "greeting".tr() + "\n${userProfile.firstName}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff19649E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.05, ),
                            child: Container(
                              height: screenHeight * 0.1,
                              width: screenWidth * 0.25,
                              child: Image.asset('assets/images/img.png', fit: BoxFit.fill),
                            ),
                          ),

                          Row(
                            children: [
                              Icon(Icons.notifications_none, color: Color(0xff19649E), size: screenWidth * 0.08),
                              SizedBox(width: 12),
                              Icon(Icons.chat_bubble_outline, color: Color(0xff19649E), size: screenWidth * 0.08),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Category List
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
                              setState(() {
                                selectedIndex = index;
                              });

                              Widget page;

                              if (selectedIndex == 0) {
                                page = HomeScreen();
                              } else if (selectedIndex == 1) {
                                page = HomeSecondScreen();
                              } else if (selectedIndex == 2) {
                                page = HomeThirdScreen();
                              } else {
                                page = HomeScreen();
                              }

                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      BlocProvider(
                                        create: (_) => UserProfileCubit(),
                                        child: page,
                                      ),
                                  transitionDuration: Duration(milliseconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 32,
                              decoration: BoxDecoration(
                                color: selectedIndex == index ? Color(0xff19649E) : Color(0xffD5D5D5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: selectedIndex == index ? Colors.white : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Image Slider
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
                    SizedBox(height: screenHeight * 0.02),

                    // Buttons
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
                              "consultation".tr(),
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
                              "instantSession".tr(),
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
                    SizedBox(height: screenHeight * 0.03),
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
                                  "therapeuticPrograms".tr(),
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
                                  "groupTherapy".tr(),
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
                                  "psychologicalDisorders".tr(),
                                  textAlign: TextAlign.center,
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
                        SizedBox(height: screenHeight * 0.025),
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
                                  "guidanceAndInstructions".tr(),
                                  textAlign: TextAlign.center,
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
                                  "solveProblems".tr(),
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
                                  "childrenDisorder".tr(),
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
                        SizedBox(height: screenHeight * 0.025),
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
                                  "PsychologicalPreventionAndFollowUp".tr(),
                                  textAlign: TextAlign.center,
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
                                  "rehabilitation".tr(),
                                  textAlign: TextAlign.center,
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
                  ],
                ),
              );
            }
            return Container(); // Default return in case no state matches
          },
        )),
    );
  }
}

//                       _buildButton(screenWidth, "consultation".tr()),
//                       _buildButton(screenWidth, "instantSession".tr()),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//
//                   // Treatment Programs
//                   _buildTreatmentPrograms(screenHeight),
//                 ],
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
//
//   Widget _buildButton(double screenWidth, String text) {
//     return Container(
//       width: screenWidth * 0.4,
//       height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Color(0xff1F78BC),
//       ),
//       child: Center(
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTreatmentPrograms(double screenHeight) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildProgramButton("therapeuticPrograms".tr(),),
//             _buildProgramButton("groupTherapy".tr()),
//             _buildProgramButton("psychologicalDisorders".tr()),
//           ],
//         ),
//         SizedBox(height: screenHeight * 0.025),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildProgramButton("guidanceAndInstructions".tr()),
//             _buildProgramButton("solveProblems".tr()),
//             _buildProgramButton("childrenDisorder".tr()),
//           ],
//         ),
//         SizedBox(height: screenHeight * 0.025),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildProgramButton("PsychologicalPreventionAndFollowUp".tr()),
//             _buildProgramButton("rehabilitation".tr()),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildProgramButton(String text) {
//     return Container(
//       width: 100,
//       height: 68,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Color(0xff69B7F3),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
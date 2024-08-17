import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditor/pages/main_screens/create_custome_exercise_page.dart';
import 'package:meditor/pages/main_screens/custom_exercise_page.dart';
import 'package:meditor/pages/main_screens/home_page.dart';
import 'package:meditor/pages/main_screens/mindfull_exercise_page.dart';
import 'package:meditor/pages/main_screens/profile_page.dart';
import 'package:meditor/utils/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selctedIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    MindfullExercisePage(),
    CreateExercisePage(),
    CustomExerciePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selctedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selctedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter: ColorFilter.mode(
                    _selctedIndex == 0
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "home_svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/brain.svg",
                colorFilter: ColorFilter.mode(
                    _selctedIndex == 1
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "brain_svg",
              ),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/circle-plus.svg",
                colorFilter: ColorFilter.mode(
                    _selctedIndex == 2
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "circle-plus",
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/file-plus-2.svg",
                colorFilter: ColorFilter.mode(
                    _selctedIndex == 3
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "circle-plus",
              ),
              label: "Custom",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/user-round-cog.svg",
                colorFilter: ColorFilter.mode(
                    _selctedIndex == 4
                        ? AppColors.primaryPurple
                        : AppColors.primaryGrey,
                    BlendMode.srcIn),
                semanticsLabel: "user-round",
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: AppColors.primaryGrey,
        ),
      ),
      body: _pages[_selctedIndex],
    );
  }
}

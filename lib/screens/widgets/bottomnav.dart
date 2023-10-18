// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:powerup/screens/bmicalculator.dart';
import 'package:powerup/screens/profile/profile_page.dart';
import 'package:powerup/screens/reportpage.dart';
import 'package:powerup/screens/screen_splash.dart';
import 'package:powerup/screens/workout/work_out.dart';
import 'package:powerup/settings_page/settings_page.dart';

String levelWorkOut = 'Beginner';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

int currentIndexs = 0;
final pageController = PageController();
final pages = [
  Workouts(
    level: levelDisplay.toUpperCase(),
  ),
  const ReportPage(),
  const BmiCalculators(),
  //  ProfilePage(),
  const SettingsPage(),
];

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
         setState(() {
            currentIndexs = value;
         });
        },
        children: pages,
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[700],
            onTap: (value) {
              setState(() {
                pageController.jumpToPage(
                    value); // Use jumpToPage instead of animateToPage
                currentIndexs = value;
              });
            },
            // onTap: (value) {
            //   setState(() {
            //     page_Controller.animateToPage(value,
            //         curve: Curves.linear,
            //         duration: const Duration(milliseconds: 200));
            //     setState(() {
            //       currentIndexs = value;
            //     });
            //   });
            // },
            currentIndex: currentIndexs,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center_outlined), label: 'Workouts'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: 'Reports'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: 'BMI'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
      ),
    );
  }
}

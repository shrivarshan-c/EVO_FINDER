import 'package:evo_finder/common/values/colors.dart';
import 'package:evo_finder/pages/home/home_page.dart';
import 'package:evo_finder/pages/map/map_home.dart';
import 'package:evo_finder/pages/profile/profile.dart';
import 'package:evo_finder/pages/review/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const MapHomePage(),
    const ReviewPage(),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    activeIcon: SizedBox(
      width: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: Colors.green[500],
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/home.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "map",
    activeIcon: SizedBox(
      width: 15.w,
      child: Image.asset(
        "assets/icons/map.png",
        color: Colors.green[500],
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/map.png",
        color: AppColors.primaryThirdElementText,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "user-reviews",
    activeIcon: SizedBox(
      width: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: Colors.green[500],
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "profile",
    activeIcon: SizedBox(
      width: 15.w,
      child: Image.asset(
        "assets/icons/person.png",
        color: Colors.green[500],
      ),
    ),
    icon: SizedBox(
      width: 15.w,
      height: 15.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
  ),
];

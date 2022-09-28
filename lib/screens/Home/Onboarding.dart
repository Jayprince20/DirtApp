import 'package:dirtapp/routes/pageRoute.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () => Get.toNamed(AppRoutes.HOME),
        onSkipButtonPressed: () => Get.toNamed(AppRoutes.HOME),
      ),
    );
  }
}

final pageList = [
  PageModel(
    color: const Color(0xFF678FB4),
    heroImagePath: 'assets/images/hyd.jpg',
    title: Text(
      'Environment',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 34.0,
      ),
    ),
    body: Text(
      '*** Keep your environment clean *** ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
    icon: Icon(
      Icons.circle_outlined,
      color: const Color(0xFF9B90BC),
    ),
  ),
  PageModel(
    color: const Color(0xFF65B0B4),
    heroImagePath: 'assets/images/hys.jpg',
    title: Text('Cleaning',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontSize: 34.0,
        )),
    body: Text(
      'We carefully with dirt at your door steps',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
    icon: Icon(
      Icons.circle_outlined,
      color: const Color(0xFF9B90BC),
    ),
  ),
  PageModel(
    color: const Color(0xFF9B90BC),
    heroImagePath: 'assets/images/pic.jpg',
    title: Text(
      'Dirt',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 34.0,
      ),
    ),
    body: Text(
      'All local departments should be kept clean',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
    icon: Icon(
      Icons.circle_outlined,
      color: const Color(0xFF9B90BC),
    ),
  ),
];

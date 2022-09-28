// ignore_for_file: prefer_const_constructors

import 'package:dirtapp/routes/pageRoute.dart';
import 'package:dirtapp/screens/Home/HomeBinding.dart';
import 'package:dirtapp/screens/Home/HomePage.dart';
import 'package:dirtapp/screens/Home/Onboarding.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      transition: Transition.fadeIn,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Onboarding,
      transition: Transition.fadeIn,
      page: () => Onboarding(),
    )
  ];
}

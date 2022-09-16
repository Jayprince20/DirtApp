import 'package:dirtapp/routes/appRoute.dart';
import 'package:dirtapp/routes/pageRoute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}

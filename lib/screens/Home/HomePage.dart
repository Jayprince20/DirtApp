import 'package:dirtapp/screens/Home/HomeCtrl.dart';
import 'package:dirtapp/screens/Home/HomeForm/Form1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/background.png"),
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hello Again,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Icon(
                      Icons.recycling_rounded,
                      size: 120,
                      color: Colors.black,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          SingleChildScrollView(
                            child: Dialog(
                              child: Container(
                                width: Get.width - 160,
                                height: 560,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: PageView(
                                        pageSnapping: true,
                                        children: [
                                          FormPageOne(),
                                        ],
                                        controller: controller.pageController,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        "Signal".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

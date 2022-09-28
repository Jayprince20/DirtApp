import 'package:dirtapp/screens/Home/HomeCtrl.dart';
import 'package:dirtapp/screens/Home/HomeForm/Form1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.air_rounded)],
        title: Text("No Waste"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Again,",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "We are here to help our community grow",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                bottom: 20,
              ),
              child: Container(
                width: 300,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 40),
                          width: 200,
                          child: Text(
                            "How can you signal a dirt?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.recycling_rounded,
                          size: 80,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                      ),
                      child: Container(
                        width: 290,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Do  you want to signal dirt ? ",
                              ),
                              Row(
                                children: [
                                  Text("Okay, Click here: "),
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
                                                      controller: controller
                                                          .pageController,
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
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

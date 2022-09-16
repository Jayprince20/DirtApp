import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dirtapp/model/placeModel.dart';
import 'package:dirtapp/repository/provider/remoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final imageList = [].obs;
  final imageListEncode = <String>[].obs;
  final picker = ImagePicker();
  final dropdownValue = PlaceModel().obs;
  final placeList = <PlaceModel>[].obs;
  final message = ''.obs;
  bool loader = false;
  var pageController = PageController();

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  @override
  void onReady() {
    getPlaceList();
    super.onReady();
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
  }

  void removeImage(element) {
    imageList.remove(element);
  }

  chosseImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      Uint8List imageBytes = imageFile.readAsBytesSync();
      var encoded = base64Encode(imageBytes);
      String imageB = Base64Encoder().convert(imageBytes);
      print(imageB);
      imageList.add(File(pickedFile.path));
      imageListEncode.add("data:image/png;base64," + encoded);
    }
  }

  void getImage(ImageSource imagesource) async {
    final pickedFile = await ImagePicker().pickImage(source: imagesource);
    if (pickedFile != null) {
    } else {
      Get.snackbar("Hello", "message", snackPosition: SnackPosition.BOTTOM);
    }
  }

  void onSaveDirt() {
    RemoteProvider().saveDirt(
      message: message.value,
      picture: imageListEncode,
      status: "FULL",
      idplace: dropdownValue.value.idplace.toString(),
      onSuccess: (note) async {
        loader = true;
        await Future.delayed(
          const Duration(seconds: 1),
        );
        Get.back();
        Get.snackbar(
          "Hello",
          "You successfully signal the dirt in town. Congrats...",
          snackPosition: SnackPosition.BOTTOM,
          barBlur: 2.0,
        );
        print("Save Success");
      },
      onError: (error) {
        print(error);
      },
    );
    update();
  }

  void getPlaceList() {
    RemoteProvider().getPlace(
      onSuccess: (place) {
        print(place);
        place.isNotEmpty ? dropdownValue.value = place[0] : print("place");
        placeList.value = place;
      },
      onError: (error) {
        print("Error place: $error");
      },
    );
  }
}

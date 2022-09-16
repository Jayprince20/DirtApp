import 'package:dirtapp/model/placeModel.dart';
import 'package:dirtapp/screens/Home/HomeCtrl.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FormPageOne extends GetWidget<HomeController> {
  const FormPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Signal dustbin",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autocorrect: true,
              onChanged: (value) {
                controller.message.value = value;
                print(value);
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Enter your message"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Container(
                width: double.infinity,
                child: DropdownButton<PlaceModel>(
                  value: controller.dropdownValue.value,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text("Select your Location"),
                  onChanged: (PlaceModel? newValues) {
                    controller.dropdownValue.value = newValues!;
                    print(newValues.idplace);
                  },
                  items: controller.placeList
                      .map<DropdownMenuItem<PlaceModel>>((PlaceModel value) {
                    return DropdownMenuItem<PlaceModel>(
                      value: value,
                      child: Text(value.placeName!),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => SizedBox(
                // height: 800,
                child: Container(
                  height: 300,
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    itemCount: controller.imageList.length + 1,
                    itemBuilder: (BuildContext context, index) {
                      return index == controller.imageList.length
                          ? InkWell(
                              onTap: () {
                                controller.chosseImage();
                              },
                              child: Container(
                                child: DottedBorder(
                                    strokeWidth: 1,
                                    radius: Radius.circular(10),
                                    dashPattern: [6, 3],
                                    child: ClipRect(
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Icon(
                                          Icons.add_a_photo_outlined,
                                        ),
                                      ),
                                    )),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                controller
                                    .removeImage(controller.imageList[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).accentColor,
                                  image: DecorationImage(
                                      image: FileImage(
                                          controller.imageList[index]),
                                      fit: BoxFit.cover),
                                ),
                                child: ClipRect(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(
                            index == 0 ? 2 : 1, index == 0 ? 2 : 1),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 10,
                      backgroundColor: Colors.red[400]),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 10,
                      backgroundColor: Colors.green),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.onSaveDirt();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

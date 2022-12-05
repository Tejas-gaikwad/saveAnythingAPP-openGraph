import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opengraph_project/Screens/Allcontent/View/allContent.dart';

import '../../../constants/constants.dart';
import '../Controller/homeScreenController.dart';
import '../Controller/singleDataController.dart';

class SingleCard extends StatelessWidget {
  final data;
  SingleCard({super.key, this.data});

  var homeScreenController = Get.put(HomeScreenController());
  var singleCardController = Get.put(SingleDataController());

  @override
  Widget build(BuildContext context) {
    print("SncakBar................  " +
        homeScreenController.showSnackBar.toString());
    // print("Response of data is.....         " +
    //     homeScreenController.isLoading.toString());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: singleCardController.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : SafeArea(
              child: singleCardController.obx(
                (state) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          homeScreenController.showSnackBar.toString(),
                          style:
                              const TextStyle(color: Colors.red, fontSize: 30),
                        ),
                      ),
                      Text(
                        singleCardController.data['title'].toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 247),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Image.network(singleCardController.data['image']
                                ['url']
                            .toString()),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        singleCardController.data['url'] == null
                            ? singleCardController.argumentData[0].toString()
                            : singleCardController.data['url'].toString(),
                        maxLines: 2,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 91, 249),
                            fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        singleCardController.data['site_name'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // print("Hi..................");

                                // print("Hi bro...............");
                                // print("Image url ...............  " +
                                //     singleCardController.data['image']['url']
                                //         .toString());
                                homeScreenController.postData(
                                  context,
                                  singleCardController.data['title'].toString(),
                                  singleCardController.data['image']['url']
                                      .toString(),
                                  singleCardController.data['url'].toString(),
                                  singleCardController.data['site_name']
                                      .toString(),
                                  singleCardController.data['type'].toString(),
                                  singleCardController.data['description']
                                      .toString(),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: primaryColor,
                                height: MediaQuery.of(context).size.height / 20,
                                // width: MediaQuery.of(context).size.width / 2,
                                child: Text("Save"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(color: primaryColor)),
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 20,
                              // width: MediaQuery.of(context).size.width / 4,
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onLoading: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.redAccent,
                )),
              ),
            ),
    );
  }
}

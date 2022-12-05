import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opengraph_project/Screens/HomeScreen/View/singleCard.dart';
import 'package:opengraph_project/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Allcontent/Controller/allContentController.dart';
import '../../Allcontent/View/allContent.dart';
import '../Controller/homeScreenController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? linkController;

  var homeScreenController = Get.put(HomeScreenController());
  var allcontentController = Get.put(AllContentController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    linkController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Enter your Link of what you want to save",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: primaryColor)),
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                    child: TextField(
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                      ),
                      controller: linkController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter link",
                          hintStyle: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return
                      Get.to(
                        () => SingleCard(),
                        arguments: [
                          linkController!.text.toString(),
                        ],
                      );
                      linkController!.clear();
                      //   },
                      // ),
                      // );

                      // homeScreenController.getData(linkController!.text);

                      // homeScreenController.isLoading.value == true.obs
                      //     ? Center(child: CircularProgressIndicator())
                      //     :
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       content: Container(
                      //         height: MediaQuery.of(context).size.height / 2,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(homeScreenController.data['title'] == ''
                      //                 ? "No title available"
                      //                 : homeScreenController.data['title']
                      //                     .toString()),
                      //             const SizedBox(height: 16),
                      //             Image.network(homeScreenController
                      //                 .data['image']['url']
                      //                 .toString()),
                      //             const SizedBox(height: 16),
                      //             Text(homeScreenController.data['url']
                      //                 .toString()),
                      //           ],
                      //         ),
                      //       ),
                      //       actionsAlignment: MainAxisAlignment.center,
                      //       actions: [
                      //         GestureDetector(
                      //           onTap: () {
                      //             homeScreenController.postData(
                      //               homeScreenController.data['title'],
                      //             );
                      //             // linkController!.clear();
                      //             // Navigator.pushReplacement(context,
                      //             //     MaterialPageRoute(
                      //             //   builder: (context) {
                      //             //     return AllContent();
                      //             //   },
                      //             // ));
                      //           },
                      //           child: Container(
                      //             alignment: Alignment.center,
                      //             width: MediaQuery.of(context).size.width / 3,
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 14, vertical: 8),
                      //             color: Colors.amber,
                      //             child: const Text(
                      //               "Save",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 14,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         GestureDetector(
                      //           onTap: () {
                      //             Navigator.pop(context);
                      //           },
                      //           child: Container(
                      //             alignment: Alignment.center,
                      //             width: MediaQuery.of(context).size.width / 3,
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 14, vertical: 8),
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(color: Colors.amber)),
                      //             child: Text(
                      //               "Cancel",
                      //               style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 14,
                      //               ),
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     );
                      //   },
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: primaryColor,
                      ),
                      width: MediaQuery.of(context).size.width / 2.1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 13),
                      child: const Icon(
                        Icons.search,
                        color: backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return AllContent();
                    },
                  ));
                },
                child: Container(
                  // alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 20,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "My Saved Content",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) {
                //         return AllContent();
                //       },
                //     ),
                //   );
                // },
                child: Container(
                  child: allcontentController.obx(
                    (State) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allcontentController.data.length < 10
                          ? allcontentController.data.length
                          : 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Future<void> _launchUrl() async {
                              if (!await launchUrl(
                                  allcontentController.data[index]['url'])) {
                                // throw 'Could not launch $url';
                              }
                            }
                          },
                          child: Container(
                            // margin: const EdgeInsets.all(10),
                            height: MediaQuery.of(context).size.height / 2.4,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.6)),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    allcontentController.data[index]['title']
                                        .toString(),
                                    maxLines: 2,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Future<void> _launchUrl() async {
                                        if (!await launchUrl(
                                            allcontentController.data[index]
                                                ['url'])) {
                                          // throw 'Could not launch $url';
                                        }
                                      }
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: Image.network(
                                          allcontentController.data[index]
                                                  ['imageUrl'] ??
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    4,
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                              ),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                        return Container(
                                          alignment: Alignment.center,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          child: const Icon(
                                            Icons.image,
                                            size: 100,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                          //     errorBuilder: (BuildContext context,
                                          //         Object exception,
                                          //         StackTrace stackTrace) {
                                          //   return Text('Your error widget...');
                                          // },
                                          frameBuilder: (context, child, frame,
                                              wasSynchronouslyLoaded) {
                                        return child;
                                      }, loadingBuilder: (context, child,
                                              loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Container(
                                            alignment: Alignment.center,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: primaryColor)),
                                          );
                                        }
                                      }),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    allcontentController.data[index]['url']
                                        .toString(),
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                  ),
                                  // const SizedBox(height: 10),
                                  // Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Icon(
                                  //       Icons.delete,
                                  //       color: Colors.white,
                                  //     ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

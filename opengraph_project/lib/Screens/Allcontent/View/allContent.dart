import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:opengraph_project/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/allContentController.dart';

class AllContent extends StatelessWidget {
  AllContent({super.key});

  var allcontentController = Get.put(AllContentController());

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(allcontentController.data[0]['title']);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: backgroundColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 22),
                  child: Text(
                    "My Saved Content",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  // height: MediaQuery.of(context).size.height / 2,
                  child: allcontentController.obx(
                    (state) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allcontentController.data.length,
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
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.6)),
                              // color: Colors.pinkAccent,
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
                                  const SizedBox(height: 10),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onLoading: Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: primaryColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:opengraph_project/Screens/Allcontent/View/allContent.dart';
import 'package:opengraph_project/constants/constants.dart';

class HomeScreenController extends GetxController {
  // Map data = {}.obs;

  var data;

  RxBool isLoading = false.obs;

  RxBool showSnackBar = false.obs;

  @override
  onInit() {
    //  getData("");

    super.onInit();
    update();
  }

  final snackBar = SnackBar(content: Text(' Content is already saved... '));

  getData(String urlLink) async {
    isLoading = true.obs;

    // print(HomeScreenModel(urlLink: urlLink).toString() +
    //     "                  PPPPPPPPPPPPPPPPPPP");

    final queryParameters = {
      'urlLink': urlLink,
      //  urlLink.toString(),
    };

    // print(urlLink.toString() + "     Its link.........................");

    var res = await http.get(
      Uri.parse(
        "http://10.0.2.2:3000/showThisCard",
      ).replace(queryParameters: queryParameters),
      // headers: <String, String>{
      //   'Content-Type': 'application/; charset=UTF-8',
      // },
    );

    data = jsonDecode(res.body);

    print("Response..........          " + data.toString());

    isLoading = false.obs;

    return data;
    // print("Its hiting 2 .........................");

    // print(res.body.toString() + "       OOOOOOOOOOOOOOOO");
  }

  postData(
    BuildContext context,
    String title,
    String imgUrl,
    String contentUrl,
    String siteName,
    String contentType,
    String description,
  ) async {
    isLoading = true.obs;

    // print(HomeScreenModel(urlLink: urlLink).toString() +
    //     "                  PPPPPPPPPPPPPPPPPPP");

    // final queryParameters = {
    //   'urlLink': urlLink,
    //   //  urlLink.toString(),
    // };

    print("     API start.........................");

    try {
      // if( contentUrl.toString() == ){}

      // for(int i =0; i < )

      var res = await http.post(
        Uri.parse(
          "http://10.0.2.2:3000/saveCard",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "title": title.toString(),
          "imageUrl": imgUrl.toString(),
          "url": contentUrl.toString(),
          "site_name": siteName.toString(),
          "type": contentType.toString(),
          "description": description.toString(),
          "date": DateTime.now().toString(),
        }),
      );

      //  jsonDecode(res.body);

      // data = cycleStatsFromJson(jsonDecode(res.body));

      print("Response..........          " + res.body.toString());

      // print(res.statusCode);

      if (res.statusCode == 200) {
        // Future.delayed(const Duration(seconds: 3));
        Get.snackbar(
          borderRadius: 6.0,
          colorText: backgroundColor,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          backgroundColor: primaryColor,
          "Success:",
          "Content is saved succesfully",
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.done, color: backgroundColor),
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.off(AllContent());

        isLoading = false.obs;
        // print("     API end.........................");
      } else {
        showSnackBar.value = true;

        print("Error ---   " + res.body.toString());
        Get.snackbar(
          borderRadius: 6.0,
          colorText: backgroundColor,
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          backgroundColor: primaryColor,
          "Error:",
          "Content is already saved",
          snackStyle: SnackStyle.FLOATING,
          icon: const Icon(Icons.error, color: backgroundColor),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
    }
  }
}

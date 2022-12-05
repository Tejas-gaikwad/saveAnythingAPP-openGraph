import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SingleDataController extends GetxController with StateMixin {
  dynamic argumentData = Get.arguments;

  var data;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getData(argumentData[0].toString());
    // print("Argument .............     " + argumentData[0].toString());
    super.onInit();
  }

  getData(String urlLink) async {
    change(null, status: RxStatus.loading());

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
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    data = jsonDecode(res.body);

    print("Response..........          " + data.toString());

    change(null, status: RxStatus.success());

    // return data;
    // print("Its hiting 2 .........................");

    // print(res.body.toString() + "       OOOOOOOOOOOOOOOO");
  }
}

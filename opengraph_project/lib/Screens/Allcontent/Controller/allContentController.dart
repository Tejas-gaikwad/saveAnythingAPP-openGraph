import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AllContentController extends GetxController with StateMixin {
  var data;
  @override
  void onInit() {
    // TODO: implement onInit
    getAllSavedContent();
    super.onInit();
  }

  Future getAllSavedContent() async {
    change(null, status: RxStatus.loading());

    var res = await http.get(
      Uri.parse("http://10.0.2.2:3000/getAllCards"),
    );

    data = await jsonDecode(res.body);

    print("Resonse.........         " + data[0].toString());

    if (res.statusCode == 200) {
      change(null, status: RxStatus.success());
    } else {
      print("error =---- " + res.body.toString());
    }

    return data;
  }
}

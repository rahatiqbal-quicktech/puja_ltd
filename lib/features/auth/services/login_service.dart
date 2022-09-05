import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class LoginService {
  logIn({required String contact, required String password}) async {
    EasyLoading.show();
    var box = GetStorage();
    try {
      final dio = Dio();
      Map<String, dynamic> data = {"contact_no": contact, "password": password};
      String url = "https://account.pujaltd.com/api/v1/login";

      var response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
        box.write(GetStorageKeys().tokenKey, response.data['token']);

        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "You are logged in");
        // log(response.data.toString());
        Get.offAll(() => const BottomNavigationBarWidget());
      } else {
        EasyLoading.dismiss();
      }
    } on Exception catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: "Invalid contact or password");
      debugPrint(e.toString());
    }
  }
}

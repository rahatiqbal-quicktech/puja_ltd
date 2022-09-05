import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/config/urls.dart';
import 'package:http/http.dart' as http;

class LoanService {
  sendLoanRequest(
      {required String amount,
      required String meth,
      required String descr}) async {
    EasyLoading.show();
    var box = GetStorage();
    try {
      String endPoint = "/api/v1/loan-request";
      String url = baseUrl + endPoint;

      Map<String, dynamic> data = {
        "amount": amount,
        "method": meth,
        "description": descr
      };

      var response = await http.post(Uri.parse(url), body: data, headers: {
        "Authorization": "Bearer ${box.read(GetStorageKeys().tokenKey)}"
      });

      // var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Get.back();
        Fluttertoast.showToast(msg: "Loan request sent");
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "Server error");
      }
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: "Server error");
    }
  }
}

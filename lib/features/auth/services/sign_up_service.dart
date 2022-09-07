import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as getx;
import 'package:puja_ltd/features/auth/login_screen.dart';
import 'package:puja_ltd/features/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp({
    required String name,
    required String fatherName,
    required String motherName,
    required String presentAddress,
    required String permanentAddress,
    required String occupation,
    required String monthlyIncome,
    required String dob,
    required String academicQ,
    required String nid,
    required String contactNo,
    required String password,
    required String email,
    required String nomineeName,
    required String nomineeDob,
    required String nomineeRelation,
    required String nomineeContact,
    required String savingsPresent,
    required String religion,
    required File image,
    required File signatureImage,
    required File nomineeImage,
    required File nomineeSignature,
  }) async {
    try {
      var dio = Dio();
      String url = "https://account.pujaltd.com/api/v1/register";

      EasyLoading.show();

      var formData = FormData.fromMap({
        'openingdate': "12345",
        'name': "name",
        'fathername': "fatherName",
        'mothername': "motherName",
        'spouse': "N/A",
        'present_address': "presentAddress",
        'parmenent_address': "permanentAddress",
        'occupation': "occupation",
        'monthly_income': "monthlyIncome",
        'dob': "12345",
        'marital_status': "Unmarried",
        'academic_qualification': "academicQ",
        'nid': "nid",
        'contact_no': "01234554321",
        'password': "123456",
        'email': "email",
        'nominee_name': "nomineeName",
        'nominee_birthday': "nomineeDob",
        'nominee_relation': "nomineeRelation",
        'nominee_contact': "nomineeContact",
        'savings_persent': "savingsPresent",
        'religion': "religion",
        'image': await MultipartFile.fromFile(image.path),
        'signature': await MultipartFile.fromFile(signatureImage.path),
        'nominee_image': await MultipartFile.fromFile(signatureImage.path),
        'nominee_signature':
            await MultipartFile.fromFile(nomineeSignature.path),
      });

      var response = await dio.post(url,
          data: formData,
          options: Options(
            followRedirects: false,
          ));
      // log(response.data);
      Future.delayed(const Duration(seconds: 2));
      EasyLoading.dismiss();
      getx.Get.to(() => const BottomNavigationBarWidget());

      // if (response.statusCode == 200) {
      //   EasyLoading.dismiss();
      //   getx.Get.to(() => const BottomNavigationBarWidget());
      // } else {
      //   EasyLoading.dismiss();
      // }
    } catch (e) {
      EasyLoading.dismiss();
      getx.Get.to(() => const BottomNavigationBarWidget());
      debugPrint(e.toString());
    }
  }

  signUpStatic({
    required String openingdate,
    required String name,
    required String fatherName,
    required String motherName,
    required String presentAddress,
    required String permanentAddress,
    required String occupation,
    required String monthlyIncome,
    required String dob,
    required String academicQualification,
    required String nid,
    required String contactNo,
    required String password,
    required String email,
    required String nomineeName,
    required String nomineeDob,
    required String nomineeRelation,
    required String nomineeContact,
    required String savingsPresent,
    required String religion,
    required File image,
    required File signatureImage,
    required File nomineeImage,
    required File nomineeSignature,
  }) async {
    try {
      var dio = Dio();
      String url = "https://account.pujaltd.com/api/v1/register";

      EasyLoading.show();

      var formData = FormData.fromMap({
        "openingdate": "${DateTime.now()}",
        "name": name,
        "fathername": fatherName,
        "mothername": motherName,
        "spouse": "N/A",
        "present_address": presentAddress,
        "parmenent_address": permanentAddress,
        "occupation": occupation,
        "monthly_income": monthlyIncome,
        "dob": dob,
        "marital_status": "Unmarried",
        "academic_qualification": academicQualification,
        "nid": nid,
        "contact_no": contactNo,
        "password": password,
        "email": email,
        "nominee_name": nomineeName,
        "nominee_birthday": nomineeDob,
        "nominee_relation": nomineeRelation,
        "nominee_contact": nomineeContact,
        "savings_persent": savingsPresent,
        "religion": religion,
        'image': await MultipartFile.fromFile(image.path),
        'signature': await MultipartFile.fromFile(signatureImage.path),
        'nominee_image': await MultipartFile.fromFile(nomineeImage.path),
        'nominee_signature':
            await MultipartFile.fromFile(nomineeSignature.path),
      });

      var response = await dio.post(
        url,
        data: formData,
      );
      log(response.data.toString());

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        getx.Get.off(() => LoginScreen());
        Fluttertoast.showToast(msg: "Signed up", backgroundColor: Colors.green);
      } else {
        EasyLoading.dismiss();
      }
      // EasyLoading.dismiss();
      // getx.Get.to(() => LoginScreen());
    } catch (e) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: e.toString());
      debugPrint(e.toString());
    }
  }

  signUpHttp() async {
    var uri = Uri.https('example.com', 'create');
    var request = http.MultipartRequest('POST', uri)
      ..fields['user'] = 'nweiz@google.com'
      ..files.add(await http.MultipartFile.fromPath(
        'package',
        'build/package.tar.gz',
      ));
    var response = await request.send();
    if (response.statusCode == 200) print('Uploaded!');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/features/auth/login_screen.dart';
import 'package:puja_ltd/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    var box = GetStorage();
    // userId = box.read(GetStorageKeys().userIdKey);
    // log("This is user id $userId");

    Future.delayed(const Duration(seconds: 2), () async {
      if (box.read(GetStorageKeys().tokenKey) == null) {
        Get.off(() => LoginScreen());
      } else {
        // GetInitialData().getInitialData();
        Get.offAll(
          () => const BottomNavigationBarWidget(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;

    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage('assets/images/app_logo.png'),
          height: height * 20,
        ),
      ),
    );
  }
}

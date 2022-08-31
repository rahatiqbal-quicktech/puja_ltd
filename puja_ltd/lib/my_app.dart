import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/bottom_nav_bar/bottom_nav_bar_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffoldBackground),
      home: const BottomNavigationBarWidget(),
    );
  }
}

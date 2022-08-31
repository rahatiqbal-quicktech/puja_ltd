import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/config/app_color_config.dart';

AppBar customAppBar({
  required String title,
  Color color = themeColor,
  double toolBarHeight = 15,
  required BuildContext context,
}) {
  return AppBar(
    toolbarHeight: getHeight(context) * toolBarHeight,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black87,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black87,
      ),
    ),
    backgroundColor: color,
    elevation: 0.1,
  );
}

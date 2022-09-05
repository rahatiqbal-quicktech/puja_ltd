import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:puja_ltd/config/app_color_config.dart';

configEasyLoading() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = themeColor;
}

import 'package:get/get.dart';
import 'package:puja_ltd/features/dps/controller/common_controller.dart';
import 'package:puja_ltd/features/navigation_drawer/controller/navigation_drawer_controller.dart';
import 'package:puja_ltd/features/profile/controller/profile_details_controller.dart';

class AllControllers {
  final commonController = Get.put(CommonController());
  final navigationDrawerController = Get.put(NavigationDrawerController());
  final profileDetailsController = Get.put(ProfileDetailsController());
}

import 'package:get/get.dart';
import 'package:puja_ltd/features/profile/service/profile_details_service.dart';

class ProfileDetailsController extends GetxController {
  var name = "".obs;
  var phone = "".obs;

  getData() async {
    var data = await ProfileDetailsService().getProfileDetails();
    if (data != null) {
      name.value = data.profile?.name ?? "Name not available";
      phone.value = data.profile?.contactNo.toString() ?? "Not available";
    }
  }
}

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/features/profile/models/profile_details_model.dart';

class ProfileDetailsService {
  Future<ProfileDetailsModel?> getProfileDetails() async {
    var box = GetStorage();
    String url = "https://account.pujaltd.com/api/v1/profile";
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer ${box.read(GetStorageKeys().tokenKey)}"
    });

    if (response.statusCode == 200) {
      return profileDetailsModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

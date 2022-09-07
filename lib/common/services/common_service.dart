import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/controllers/all_controllers.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/common/models/common_model.dart';
import 'package:puja_ltd/config/urls.dart';
import 'package:http/http.dart' as http;

class CommonService with AllControllers {
  Future<CommonModel?> getData() async {
    // var dio = Dio();
    var box = GetStorage();

    // String endPoint = "/api/v1/dps-request/history";
    String url = baseUrl + commonController.endPoint.value;
    // var response = await dio.get(url);
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer ${box.read(GetStorageKeys().tokenKey)}"
    });

    if (response.statusCode == 200) {
      return commonModelFromJson(response.body);
    } else {
      return null;
    }
  }
}

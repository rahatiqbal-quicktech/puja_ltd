import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_ltd/common/controllers/all_controllers.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/models/common_model.dart';
import 'package:puja_ltd/common/screens/common_details_screen.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/common/services/common_service.dart';

class CommonScreen extends StatefulWidget {
  const CommonScreen({Key? key}) : super(key: key);

  @override
  State<CommonScreen> createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> with AllControllers {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: customAppBar(
            title: commonController.string.value, context: context),
        body: FutureBuilder<CommonModel?>(
            future: CommonService().getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              var temp = snapshot.data;
              if (temp?.data!.length == 0) {
                return Column(
                  children: [
                    VerticalSpace(height: getHeight(context) * 5),
                    const Text("No data available"),
                  ],
                );
              }
              return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: temp?.data!.length,
                  itemBuilder: (context, index) {
                    var data = temp?.data![index];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: buttonColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.to(() => CommonDetailsScreen(data: data!));
                        },
                        title: Text(
                            "${commonController.listTileName.value} ID ${data?.id}"),
                        subtitle: Text("Status : ${data?.status}"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  });
            }),
      );
    });
  }
}

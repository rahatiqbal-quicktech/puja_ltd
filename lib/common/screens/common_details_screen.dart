import 'package:flutter/material.dart';
import 'package:puja_ltd/common/models/common_model.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/config/app_color_config.dart';

class CommonDetailsScreen extends StatelessWidget {
  const CommonDetailsScreen({Key? key, required this.data}) : super(key: key);
  final Datum data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Details", context: context),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: buttonColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text("Status : ${data.status}"),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text("ID : ${data.id}"),
          ),
          const Divider(),
          ListTile(
            title: Text("Somiti ID : ${data.somitiId}"),
          ),
          const Divider(),
          ListTile(
            title: Text("Amount : ${data.amount}"),
          ),
          const Divider(),
          data.method == null
              ? Container()
              : ListTile(
                  title: Text("Method : ${data.method}"),
                ),
          const Divider(),
          data.description == null
              ? Container()
              : ListTile(
                  title: Text("Description : ${data.description}"),
                )
        ],
      ),
    );
  }
}

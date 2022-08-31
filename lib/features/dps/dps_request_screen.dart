import 'package:flutter/material.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';

class DpsRequestScreen extends StatelessWidget {
  const DpsRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "DPS Request",
          toolBarHeight: 15,
          color: themeColor,
          context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const VerticalSpace(height: 10),
            const Center(
                child: Text(
              "Send a DPS request",
              textAlign: TextAlign.center,
            )),
            const VerticalSpace(height: 20),
            const ThemeColorTextFormField(
                icondata: Icons.money, hint: "Amount"),
            const VerticalSpace(height: 10),
            const ThemeColorTextFormField(
                icondata: Icons.credit_card, hint: "Method"),
            const VerticalSpace(height: 10),
            const ThemeColorTextFormField(
                icondata: Icons.pages, hint: "Description"),
            const VerticalSpace(height: 10),
            RoundButtonWidget(
                labelText: "Send",
                backgroundColor: buttonColor,
                function: () {}),
          ],
        ),
      ),
    );
  }
}

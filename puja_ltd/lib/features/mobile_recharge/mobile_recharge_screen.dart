import 'package:flutter/material.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';

class MobileRechargeScreen extends StatelessWidget {
  const MobileRechargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Mobile Recharge",
          toolBarHeight: 15,
          color: themeColor,
          context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const VerticalSpace(height: 10),
            const Center(
                child: Text(
              "Write your mobile number below for \nmobile recharge.",
              textAlign: TextAlign.center,
            )),
            const VerticalSpace(height: 20),
            const ThemeColorTextFormField(
                icondata: Icons.phone_iphone, hint: "Amount"),
            const VerticalSpace(height: 10),
            SizedBox(
              width: 200,
              child: RoundButtonWidget(
                  labelText: "Recharge Now",
                  backgroundColor: buttonColor,
                  function: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

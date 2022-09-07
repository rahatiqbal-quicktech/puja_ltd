import 'package:flutter/material.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/deposit/service/deposit_service.dart';

class DepositRequestScreen extends StatelessWidget {
  DepositRequestScreen({Key? key}) : super(key: key);
  final TextEditingController amount = TextEditingController();
  final TextEditingController meth = TextEditingController();
  final TextEditingController descr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Deposit Request",
          toolBarHeight: 15,
          color: themeColor,
          context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const VerticalSpace(height: 10),
              const Center(
                  child: Text(
                "Send a Deposit request",
                textAlign: TextAlign.center,
              )),
              const VerticalSpace(height: 20),
              ThemeColorTextFormField(
                  textEditingController: amount,
                  textInputType: TextInputType.number,
                  icondata: Icons.money,
                  hint: "Amount"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: meth,
                  icondata: Icons.credit_card,
                  hint: "Method"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: descr,
                  icondata: Icons.pages,
                  hint: "Description"),
              const VerticalSpace(height: 10),
              RoundButtonWidget(
                  labelText: "Send",
                  backgroundColor: buttonColor,
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      DepositService().sendDepositRequest(
                          amount: amount.text,
                          meth: meth.text,
                          descr: descr.text);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

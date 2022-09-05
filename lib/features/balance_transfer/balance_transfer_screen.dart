import 'package:flutter/material.dart';
import 'package:puja_ltd/common/widgets/custom_app_bar.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/theme_color_textformfield.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/balance_transfer/service/balance_transfer_service.dart';

class BalanceTransferScreen extends StatelessWidget {
  BalanceTransferScreen({Key? key}) : super(key: key);
  final TextEditingController amount = TextEditingController();
  final TextEditingController receiverMember = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Balance Transfer",
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
                "Send a Balance Transfer request",
                textAlign: TextAlign.center,
              )),
              const VerticalSpace(height: 20),
              ThemeColorTextFormField(
                  textEditingController: receiverMember,
                  textInputType: TextInputType.number,
                  icondata: Icons.money,
                  hint: "Reciever Member"),
              const VerticalSpace(height: 10),
              ThemeColorTextFormField(
                  textEditingController: amount,
                  textInputType: TextInputType.number,
                  icondata: Icons.pages,
                  hint: "Amount"),
              const VerticalSpace(height: 10),
              RoundButtonWidget(
                  labelText: "Send",
                  backgroundColor: buttonColor,
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      BalanceTransferService().sendBalanceTransferRequest(
                          amount: amount.text,
                          receiverMember: receiverMember.text);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/common/widgets/round_button_widget.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/balance_transfer/balance_transfer_screen.dart';
import 'package:puja_ltd/features/deposit/deposit_request_screen.dart';
import 'package:puja_ltd/features/dps/dps_request_screen.dart';
import 'package:puja_ltd/features/loan/loan_request_screen.dart';
import 'package:puja_ltd/features/mobile_recharge/mobile_recharge_screen.dart';
import 'package:puja_ltd/features/product_loan/product_loan_screen.dart';
import 'package:puja_ltd/features/saving/screens/saving_request_screen.dart';

import 'widgets/home_screen_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            // padding: const EdgeInsets.all(10),
            height: getHeight(context) * 15,
            width: double.infinity,
            color: themeColor,
            child: Center(
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/app_logo.png'),
                ),
                title: const Text("Rosy Afsari"),
                subtitle: const Text("01795523542"),
                trailing: RoundButtonWidget(
                    labelText: "Balance",
                    backgroundColor: buttonColor,
                    function: () {}),
              ),
            ),
          ),
          Container(
            // height: getHeight(context) * 20,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeScreenButton(
                        name: "Mobile Recharge",
                        icon: Icons.phone_iphone,
                        color: buttonColor,
                        function: () {
                          // var box = GetStorage();
                          // log(box.read(GetStorageKeys().tokenKey));

                          Get.to(() => MobileRechargeScreen());
                        }),
                    HomeScreenButton(
                        name: "Recharge History",
                        icon: Icons.attach_money,
                        color: Colors.blueAccent),
                    HomeScreenButton(
                        function: () {
                          Get.to(() => SavingRequestScreen());
                        },
                        name: "Saving Request",
                        icon: Icons.data_saver_on,
                        color: Colors.green),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeScreenButton(
                        name: "Saving Request History",
                        icon: Icons.inventory,
                        color: Colors.orange),
                    HomeScreenButton(
                        function: () {
                          Get.to(() => LoanRequestScreen());
                        },
                        name: "Loan Request",
                        icon: Icons.credit_score,
                        color: Colors.greenAccent),
                    HomeScreenButton(
                        name: "Loan Request History",
                        icon: Icons.credit_score_outlined,
                        color: Colors.teal),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeScreenButton(
                        function: () {
                          Get.to(() => DpsRequestScreen());
                        },
                        name: "Dps Request",
                        icon: Icons.add_business,
                        color: Colors.indigo),
                    HomeScreenButton(
                        name: "Dps Request History",
                        icon: Icons.toll,
                        color: Colors.black45),
                    HomeScreenButton(
                        function: () {
                          Get.to(() => DepositRequestScreen());
                        },
                        name: "Deposit Request",
                        icon: Icons.credit_score_outlined,
                        color: Colors.green),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeScreenButton(
                        name: "Deposit Request History",
                        icon: Icons.attach_money,
                        color: Colors.lime),
                    HomeScreenButton(
                        function: () {
                          Get.to(() => ProductLoanRequestScreen());
                        },
                        name: "Product Loan Request",
                        icon: Icons.ad_units_sharp,
                        color: const Color.fromARGB(255, 231, 142, 9)),
                    HomeScreenButton(
                        name: "Product Loan History",
                        icon: Icons.workspaces_outline,
                        color: Colors.green),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeScreenButton(
                        function: () {
                          Get.to(() => BalanceTransferScreen());
                        },
                        name: "Balance Transfer",
                        icon: Icons.add,
                        color: const Color.fromARGB(255, 109, 96, 230)),
                    HomeScreenButton(
                        name: "Balance Transfer History",
                        icon: Icons.add_alert_outlined,
                        color: const Color.fromARGB(255, 167, 48, 68)),
                    const SizedBox(
                      height: 80,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeScreenButton(
                    name: "Savings History",
                    icon: Icons.add_ic_call_outlined,
                    color: const Color.fromARGB(255, 245, 52, 94)),
                HomeScreenButton(
                    name: "Loan History",
                    icon: Icons.ac_unit,
                    color: const Color.fromARGB(255, 226, 255, 61)),
                HomeScreenButton(
                    name: "Dps History",
                    icon: Icons.credit_score,
                    color: const Color.fromARGB(255, 72, 0, 139)),
                HomeScreenButton(
                    name: "Deposit History",
                    icon: Icons.ad_units_sharp,
                    color: const Color.fromARGB(255, 64, 255, 38)),
              ],
            ),
          ),
          const VerticalSpace(height: 10),
        ],
      )),
    );
  }
}

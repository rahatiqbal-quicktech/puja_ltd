import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/widgets/home_screen_button.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/balance_transfer/balance_transfer_screen.dart';
import 'package:puja_ltd/features/deposit/deposit_request_screen.dart';
import 'package:puja_ltd/features/dps/dps_request_screen.dart';
import 'package:puja_ltd/features/loan/loan_request_screen.dart';
import 'package:puja_ltd/features/mobile_recharge/mobile_recharge_screen.dart';
import 'package:puja_ltd/features/product_loan/product_loan_screen.dart';
import 'package:puja_ltd/features/saving/screens/saving_request_screen.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            VerticalSpace(height: getHeight(context) * 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // VerticalSpace(height: getHeight(context) * 5),
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
                    function: () {
                      Get.to(() => DpsRequestScreen());
                    },
                    name: "Dps Request",
                    icon: Icons.add_business,
                    color: Colors.indigo),
                HomeScreenButton(
                    function: () {
                      Get.to(() => SavingRequestScreen());
                    },
                    name: "Saving Request",
                    icon: Icons.data_saver_on,
                    color: Colors.green),
                HomeScreenButton(
                    function: () {
                      Get.to(() => LoanRequestScreen());
                    },
                    name: "Loan Request",
                    icon: Icons.credit_score,
                    color: Colors.greenAccent),
              ],
            ),
            const VerticalSpace(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeScreenButton(
                    function: () {
                      Get.to(() => DepositRequestScreen());
                    },
                    name: "Deposit Request",
                    icon: Icons.credit_score_outlined,
                    color: Colors.green),
                HomeScreenButton(
                    function: () {
                      Get.to(() => ProductLoanRequestScreen());
                    },
                    name: "Product Loan Request",
                    icon: Icons.ad_units_sharp,
                    color: const Color.fromARGB(255, 231, 142, 9)),
                HomeScreenButton(
                    function: () {
                      Get.to(() => BalanceTransferScreen());
                    },
                    name: "Balance Transfer",
                    icon: Icons.add,
                    color: const Color.fromARGB(255, 109, 96, 230)),
                const SizedBox(
                  height: 87,
                  width: 85,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

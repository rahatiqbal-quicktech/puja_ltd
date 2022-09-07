import 'package:flutter/material.dart';
import 'package:puja_ltd/common/controllers/all_controllers.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/widgets/home_screen_button.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';

class HistoryScreen extends StatelessWidget with AllControllers {
  HistoryScreen({Key? key}) : super(key: key);

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
            const VerticalSpace(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeScreenButton(
                    function: () {
                      commonController.dpsHistory();
                    },
                    name: "Dps Request History",
                    icon: Icons.toll,
                    color: Colors.black45),
                HomeScreenButton(
                    function: () {
                      commonController.mobileRechargeHistory();
                    },
                    name: "Recharge History",
                    icon: Icons.attach_money,
                    color: Colors.blueAccent),
                HomeScreenButton(
                    function: () {
                      commonController.savingRequestHistory();
                    },
                    name: "Saving Request History",
                    icon: Icons.inventory,
                    color: Colors.orange),
                HomeScreenButton(
                    function: () {
                      commonController.loanRequestHistory();
                    },
                    name: "Loan Request History",
                    icon: Icons.credit_score_outlined,
                    color: Colors.teal),
              ],
            ),
            const VerticalSpace(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeScreenButton(
                    function: () {
                      commonController.productLoanHistory();
                    },
                    name: "Product Loan History",
                    icon: Icons.workspaces_outline,
                    color: Colors.green),
                HomeScreenButton(
                    function: () {
                      commonController.balanceTransferHistory();
                    },
                    name: "Balance Transfer History",
                    icon: Icons.add_alert_outlined,
                    color: const Color.fromARGB(255, 167, 48, 68)),
                Container(
                  height: 87,
                  width: 85,
                ),
                Container(
                  height: 87,
                  width: 85,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

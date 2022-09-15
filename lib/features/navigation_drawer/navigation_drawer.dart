import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/controllers/all_controllers.dart';
import 'package:puja_ltd/common/functions/get_screen_height_width.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/config/app_color_config.dart';
import 'package:puja_ltd/features/auth/login_screen.dart';
import 'package:puja_ltd/features/balance_transfer/balance_transfer_screen.dart';
import 'package:puja_ltd/features/deposit/deposit_request_screen.dart';
import 'package:puja_ltd/features/dps/dps_request_screen.dart';
import 'package:puja_ltd/features/loan/loan_request_screen.dart';
import 'package:puja_ltd/features/mobile_recharge/mobile_recharge_screen.dart';
import 'package:puja_ltd/features/product_loan/product_loan_screen.dart';
import 'package:puja_ltd/features/saving/screens/saving_request_screen.dart';

class SideNavigationDrawer extends StatelessWidget with AllControllers {
  SideNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  // const VerticalSpace(height: 30),
                  Container(
                    height: getHeight(context) * 15,
                    color: themeColor,
                    child: const Center(
                      child: ListTile(
                        title: Text("Rosy Afsari"),
                        subtitle: Text("01795523542"),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      navigationDrawerController.mobileRechargeMenu();
                    },
                    leading: Icon(
                      Icons.phone_iphone,
                      color: buttonColor,
                    ),
                    title: const Text("Mobile Recharge"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                  navigationDrawerController.showMobileRechargeMenu.value ==
                          true
                      ? Submenu(
                          function: () {
                            Get.to(() => MobileRechargeScreen());
                          },
                          menuName: "Recharge",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.savingsMenu();
                      },
                      leading: const Icon(
                        Icons.data_saver_on,
                        color: Colors.green,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Saving")),
                  navigationDrawerController.showSavingseMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => SavingRequestScreen());
                          },
                          menuName: "Saving",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.loanMenu();
                      },
                      leading:
                          const Icon(Icons.credit_score, color: Colors.orange),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Loan")),
                  navigationDrawerController.showLoanMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => LoanRequestScreen());
                          },
                          menuName: "Loan",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.dpsMenu();
                      },
                      leading:
                          const Icon(Icons.point_of_sale, color: Colors.indigo),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Dps")),
                  navigationDrawerController.showDpsMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => DpsRequestScreen());
                          },
                          menuName: "Dps",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.depositMenu();
                      },
                      leading: const Icon(Icons.add_card, color: Colors.green),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Deposit")),
                  navigationDrawerController.showDepositMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => DepositRequestScreen());
                          },
                          menuName: "Deposit",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.productLoanMenu();
                      },
                      leading: const Icon(Icons.credit_score,
                          color: Color.fromARGB(255, 231, 142, 9)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Product Loan")),
                  navigationDrawerController.showProductLoanMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => ProductLoanRequestScreen());
                          },
                          menuName: "Product Loan",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        navigationDrawerController.balanceMenu();
                      },
                      leading: const Icon(Icons.account_balance,
                          color: Color.fromARGB(255, 167, 48, 68)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      title: const Text("Balance")),
                  navigationDrawerController.showBalanceMenu.value == true
                      ? Submenu(
                          function: () {
                            Get.to(() => BalanceTransferScreen());
                          },
                          menuName: "Balance",
                        )
                      : Container(),
                  ListTile(
                      onTap: () {
                        var box = GetStorage();
                        box.remove(GetStorageKeys().tokenKey).then((value) {
                          Get.offAll(() => LoginScreen());
                        });
                      },
                      // leading: const Icon(Icons.account_balance),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class Submenu extends StatelessWidget {
  const Submenu({
    required this.menuName,
    Key? key,
    required this.function,
  }) : super(key: key);
  final String menuName;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              if (function != null) {
                function();
              }
            },
            title: Text("$menuName Request"),
          ),
          ListTile(
            title: Text("$menuName History"),
          )
        ],
      ),
    );
  }
}

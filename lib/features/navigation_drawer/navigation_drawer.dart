import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:puja_ltd/common/get_storage_keys.dart';
import 'package:puja_ltd/common/widgets/vertical_space.dart';
import 'package:puja_ltd/features/auth/login_screen.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const VerticalSpace(height: 30),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.phone_iphone),
                  title: const Text("Mobile Recharge")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.data_saver_on),
                  title: const Text("Saving")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.credit_score),
                  title: const Text("Loan")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.point_of_sale),
                  title: const Text("Dps")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.add_card),
                  title: const Text("Deposit")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.credit_score),
                  title: const Text("Product Loan")),
              ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.account_balance),
                  title: const Text("Balance")),
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
          ),
        ),
      ),
    );
  }
}

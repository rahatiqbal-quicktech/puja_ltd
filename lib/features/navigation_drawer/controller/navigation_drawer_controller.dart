import 'package:get/get.dart';

class NavigationDrawerController extends GetxController {
  var showMobileRechargeMenu = false.obs;
  var showSavingseMenu = false.obs;
  var showLoanMenu = false.obs;
  var showDpsMenu = false.obs;
  var showDepositMenu = false.obs;
  var showProductLoanMenu = false.obs;
  var showBalanceMenu = false.obs;

  mobileRechargeMenu() {
    showMobileRechargeMenu.toggle();
  }

  savingsMenu() {
    showSavingseMenu.toggle();
  }

  loanMenu() {
    showLoanMenu.toggle();
  }

  dpsMenu() {
    showDpsMenu.toggle();
  }

  depositMenu() {
    showDepositMenu.toggle();
  }

  productLoanMenu() {
    showProductLoanMenu.toggle();
  }

  balanceMenu() {
    showBalanceMenu.toggle();
  }
}

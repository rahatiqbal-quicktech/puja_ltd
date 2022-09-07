import 'package:get/get.dart';
import 'package:puja_ltd/common/models/common_model.dart';
import 'package:puja_ltd/common/screens/common_screen.dart';

class CommonController extends GetxController {
  var commonModel = CommonModel().obs;
  var commonModelData = <Datum>[].obs;
  var endPoint = "".obs;
  var string = "".obs;
  var listTileName = "".obs;

  getCommonData() async {}

  dpsHistory() {
    listTileName.value = "Dps Request";
    string.value = "Dps Request History";
    endPoint.value = "/api/v1/dps-request/history";
    Get.to(() => const CommonScreen());
  }

  balanceTransferHistory() {
    listTileName.value = "Balance Transfer Request";
    string.value = "Balance Transfer Request History";
    endPoint.value = "/api/v1/balance/transfer-history";
    Get.to(() => const CommonScreen());
  }

  loanRequestHistory() {
    listTileName.value = "Loan Request";
    string.value = "Loan Request History";
    endPoint.value = "/api/v1/loan-request/history";
    Get.to(() => const CommonScreen());
  }

  depositRequestHistory() {
    listTileName.value = "Deposit Request";
    string.value = "Deposit Request History";
    endPoint.value = "/api/v1/deposit-request/history";
    Get.to(() => const CommonScreen());
  }

  productLoanHistory() {
    listTileName.value = "Product Loan Request";
    string.value = "Product Loan Request History";
    endPoint.value = "/api/v1/product-loan-request/history";
    Get.to(() => const CommonScreen());
  }

  savingRequestHistory() {
    listTileName.value = "Saving Request";
    string.value = "Saving Request History";
    endPoint.value = "/api/v1/saving-request/history";
    Get.to(() => const CommonScreen());
  }

  mobileRechargeHistory() {
    listTileName.value = "Mobile Recharge Request";
    string.value = "Mobile Recharge Request History";
    endPoint.value = "/api/v1/mobile-recharge/history";
    Get.to(() => const CommonScreen());
  }
}

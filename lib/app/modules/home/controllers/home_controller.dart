import 'package:get/get.dart';
import 'package:softcent_card/app/Network/ApiCall/fetchTransactionData.dart';

class HomeController extends GetxController {

  var transactionDataList = [].obs;
  var isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    transactionDataController();
  }

  void transactionDataController() async {
    isLoading(true);
    try{
      var transactionData = await TransactionDataAPI().getTransactionData();
      if(transactionData != null) {
        transactionDataList.assignAll(transactionData);
      }
    } finally {isLoading(false);}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

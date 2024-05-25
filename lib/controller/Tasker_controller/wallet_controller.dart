import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../models/tasker_models/wallet_model.dart';

class WalletController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWalletData();
  }

  Rx<WalletModel> walletModel = WalletModel().obs;
  RxBool walletLoading = false.obs;

  getWalletData() async {
    walletLoading(true);
    var response = await ApiClient.getData(ApiConstants.walletEndPoint);

    if (response.statusCode == 200) {
      walletModel.value = WalletModel.fromJson(response.body);
      walletLoading(false);
    }
  }
}

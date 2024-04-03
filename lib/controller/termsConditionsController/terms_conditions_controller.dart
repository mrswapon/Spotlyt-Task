import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';

class TermsConditionsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

  @override
  void onInit() {
    getTermsCondition();
    super.onInit();
  }
//==============================> Get Terms and Condition Method <==========================
  getTermsCondition() async {
    isLoading.value = true;
    var response =
        await ApiClient.getData(ApiConstants.termsConditionsEndPoint);
    print('=====. response : ${response.body}');
    if (response.statusCode == 200) {
      var data = response.body;
      var attributes = data['data']['attributes'];
      print('=========(_) $attributes');
    } else {
      Get.snackbar(
          response.statusCode.toString(), response.statusText ?? "error");
    }
    isLoading.value = false;
  }
}

import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';

class PrivacyPolicyController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;
  @override
  void onInit() {
    getPrivacy();
    super.onInit();
  }

  getPrivacy() async {
    isLoading.value = true;
    var response = await ApiClient.getData(ApiConstants.privacyPolicyEndPoint);
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

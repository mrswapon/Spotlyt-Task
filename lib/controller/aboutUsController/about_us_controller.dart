import 'package:get/get.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';

class AboutUsController extends GetxController{

  RxBool isLoading = false.obs;
  RxString content = ''.obs;

  @override
  void onInit() {
    getAboutUs();
    super.onInit();
  }
//==============================> Get About Us Method <==========================
  getAboutUs() async {
    isLoading.value = true;
    var response =
    await ApiClient.getData(ApiConstants.aboutUsEndPoint);
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../models/requester_home_screen_model.dart';

class RequesterHomeController extends GetxController {
  RequesterHomeScreenModel? homeScreenModel;
  @override
  void onInit() {
    requesterTaskService();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  final ScrollController categoryScrollController = ScrollController();
  final ScrollController earlyAccessScrollController = ScrollController();

  //=====================> Page Scroll Method <=================================

  requesterTaskService() async {
    isLoading.value = true;
    var response = await ApiClient.getData(ApiConstants.requesterTaskService);
    print(response);
    if (response.statusCode == 200) {
      homeScreenModel = RequesterHomeScreenModel.fromJson(response.body);
    } else {
      Get.snackbar(
          response.statusCode.toString(), response.statusText ?? "error");
    }
    isLoading.value = false;
  }
}

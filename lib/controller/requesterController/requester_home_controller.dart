import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../models/requester_home_screen_model.dart';
import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';

class RequesterHomeController extends GetxController {
  RequesterHomeScreenModel? homeScreenModel;
  @override
  void onInit() {
    requesterTaskService();
    super.onInit();
  }

  // RxBool isLoading = false.obs;
  final ScrollController categoryScrollController = ScrollController();
  final ScrollController earlyAccessScrollController = ScrollController();

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  //=====================> Get Task Service Method <============================

  requesterTaskService() async {
    setRxRequestStatus(Status.loading);
    // isLoading.value = true;
    var response = await ApiClient.getData(ApiConstants.requesterTaskService);
    if (response.statusCode == 200) {
      homeScreenModel = RequesterHomeScreenModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
        Get.snackbar(
            response.statusCode.toString(), response.statusText ?? "error");
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../utils/app_constant.dart';

class TaskerHomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaskerHomeDataAll();
    getTaskerHomeDataToday();
  }

  Rx<TaskerHomeModel> taskerHomeModelAll = TaskerHomeModel().obs;
  Rx<TaskerHomeModel> taskerHomeModelToday = TaskerHomeModel().obs;

  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  getTaskerHomeDataAll() async {
    var response = await ApiClient.getData(ApiConstants.taskerHomeEidPoint);

    if (response.statusCode == 200) {
      taskerHomeModelAll.value = TaskerHomeModel.fromJson(response.body);

      refresh();
    }
  }

  getTaskerHomeDataToday() async {
    var response = await ApiClient.getData(
        "${ApiConstants.taskerHomeEidPoint}?type=others");

    if (response.statusCode == 200) {
      taskerHomeModelToday.value = TaskerHomeModel.fromJson(response.body);
      refresh();
    }
  }

  ///==================== task Register ==========================>
  taskRegister(String name, taskId, price) async {
    var body = {"name": name, "taskId": taskId, "price": price};

    var response =
        await ApiClient.postData(ApiConstants.taskRegisterEndPoint, body);

    if (response.statusCode == 200) {
      var taskId = response.body['data']['attributes']['_id'];
      print("==============================> id : $taskId");
      Get.toNamed(AppRoutes.submitTaskScreen, parameters: {
        'taskId': taskId,
      });
    }
  }

  summitTask(String id, File image) async {
    List<MultipartBody> multipartBody =
        image == null ? [] : [MultipartBody("image", image)];
    var body = {'id': id};

    var respose = await ApiClient.patchMultipartData(
        ApiConstants.taskRegisterEndPoint, body,
        multipartBody: multipartBody);

    if (respose.statusCode == 200 || respose.statusCode == 201) {
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
    }
  }
}

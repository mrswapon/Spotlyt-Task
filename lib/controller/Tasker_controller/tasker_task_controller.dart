import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_task_model.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerBottomNavBar/tasker_bottom_controller.dart';

import '../../routes/app_routes.dart';
import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';
import '../../views/screens/Tasker/submitTaskScreen/InnerWidget/sucessfull_dialog.dart';

class TaskerTaskController extends GetxController {
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  RxList<Tasks> taskerTaskList = <Tasks>[].obs;
  RxBool isSelected = true.obs;
  RxString status = 'submitted'.obs;
  RxInt tabBarIndex = 0.obs;

  void setStatus(String newStatus) {
    status.value = newStatus;
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  int page = 1;
  var isFirstLoadRunning = false.obs;
  var isLoadMoreRunning = false.obs;
  var totalPage = (-1);
  var currentPage = (-1);

  refreshLoad() async {
    page = 1;
    var response = await ApiClient.getData(
        ApiConstants.allTaskGetApi("$status&page=$page"));
    if (response.statusCode == 200) {
      var demoModel = TaskerTaskModel.fromJson(response.body);
      currentPage = demoModel.data!.attributes!.page!;
      totalPage = demoModel.data!.attributes!.totalPages!;

      taskerTaskList.value = demoModel.data!.attributes!.tasks!;

      taskerTaskList.refresh();
    } else if (response.statusCode == 404) {
      taskerTaskList.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  fastLoad() async {
    page = 1;
    isFirstLoadRunning(true);
    var response = await ApiClient.getData(
        ApiConstants.allTaskGetApi("$status&page=$page"));
    if (response.statusCode == 200) {
      var demoModel = TaskerTaskModel.fromJson(response.body);
      currentPage = demoModel.data!.attributes!.page!;
      totalPage = demoModel.data!.attributes!.totalPages!;
      taskerTaskList.value = demoModel.data!.attributes!.tasks!;

      debugPrint("Task List Length : ${taskerTaskList.length}");
      isFirstLoadRunning(false);
      taskerTaskList.refresh();
      setRxRequestStatus(Status.completed);
    } else if (response.statusCode == 404) {
      taskerTaskList.refresh();
      isFirstLoadRunning(false);
    } else {
      isFirstLoadRunning(false);
      ApiChecker.checkApi(response);
    }
  }

  loadMore() async {
    debugPrint("========> load more");
    if (isFirstLoadRunning.value != true &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page += 1;
      var response = await ApiClient.getData(
          ApiConstants.allTaskGetApi("$status&page=$page"));

      if (response.statusCode == 200) {
        var demoModel = TaskerTaskModel.fromJson(response.body);
        currentPage = demoModel.data!.attributes!.page!;
        totalPage = demoModel.data!.attributes!.totalPages!;
        taskerTaskList.addAll(demoModel.data!.attributes!.tasks!);
        taskerTaskList.refresh();
        isLoadMoreRunning(false);
      } else {
        ApiChecker.checkApi(response);
        isLoadMoreRunning(false);
      }
    }
  }

  var loading = false.obs;
  taskRegisterAndSubmit(String name, taskId,double price, File image) async {
    loading(true);
    var body = {"name": name, "taskId": taskId, "price":"${price/2}"};
    var response =
        await ApiClient.postData(ApiConstants.taskRegisterEndPoint, body);
    if (response.statusCode == 200) {
      var taskRegId = response.body['data']['attributes']['_id'];
      await submitTask(taskRegId, image);
    } else {
      var message = response.body['message'];
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    loading(false);
    update();
  }

  submitTask(String id, File image) async {
    List<MultipartBody> multipartBody = [MultipartBody("image", image)];
    var body = {'submitTaskId': id};

    var response = await ApiClient.patchMultipartData(
        ApiConstants.taskRegisterEndPoint, body,
        multipartBody: multipartBody);
    if (response.statusCode == 200 || response.statusCode == 201) {
      showDialog(
        barrierDismissible: false,
          context: Get.context!,
          builder: (_) => const CustomSuccessAlertBox(
                title: 'Successfully',
                subTitle: 'Your task has been successfully submitted.',
              ));
    } else {
      ApiChecker.checkApi(response);
    }
  }
}

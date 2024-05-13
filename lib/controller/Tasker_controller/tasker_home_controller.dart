import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';

class TaskerHomeController extends GetxController {

  int page = 1;
  var totalPage=(-1);
  var currentPage=(-1);
  var taskRegId = "".obs;

  var alreadyTaskRegister = <String>[].obs;
  var registerTaskIdList = <String>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getTaskerHomeDataToday();
    loadMore();
  }

  RxList<Task> todayTaskList = <Task>[].obs;
  RxList<Task> allTaskList = <Task>[].obs;


  loadMore(){
    if(totalPage != currentPage && totalPage > page){
      print("=======page increment \n current page is : $page");
      page+=1;
    }
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  ///==========================Get Tasker Home Data All=======================>
  getTaskerHomeDataAll() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData("${ApiConstants.taskerHomeEidPoint}?page=$page");
    if (response.statusCode == 200) {
      var demoData=TaskerHomeModel.fromJson(response.body);
      allTaskList.value = demoData.data!.attributes!.tasks??[];
       totalPage = jsonDecode(response.body['data']['attributes']['totalPages'].toString());
      currentPage = jsonDecode(response.body['data']['attributes']['page'].toString());
      print("=================$totalPage \n $currentPage");
      allTaskList.refresh();
      setRxRequestStatus(Status.completed);
      refresh();
      update();
    } else {
      if(response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      }else{
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }


  ///=========================get tasker home data Today=========================>
  getTaskerHomeDataToday() async {
    var response = await ApiClient.getData("${ApiConstants.taskerHomeEidPoint}?page=$page&type=today");

    if (response.statusCode == 200) {
      var demoData=TaskerHomeModel.fromJson(response.body);
      todayTaskList.value = demoData.data!.attributes!.tasks??[];
      todayTaskList.refresh();
      await  getTaskerHomeDataAll();
      refresh();
    }
  }

  ///==================== task Register ==========================>
  //  var loading=false.obs;
  // taskRegister(String name, taskId, price) async {
  //   loading(true);
  //   var body = {"name": name, "taskId": taskId, "price": price};
  //   var response = await ApiClient.postData(ApiConstants.taskRegisterEndPoint, body);
  //   if (response.statusCode == 200) {
  //      taskRegId.value = response.body['data']['attributes']['_id'];
  //
  //       print("==============================> id for submitted: $taskId");
  //
  //     alreadyTaskRegister.add(taskId);
  //      registerTaskIdList.add(response.body['data']['attributes']["_id"]);
  //
  //     alreadyTaskRegister.refresh();
  //   }else{
  //    var message =  response.body['message'];
  //     Fluttertoast.showToast(
  //         msg: message,
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 3,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //       Get.offAllNamed(AppRoutes.taskerBottomNavBar);
  //   }
  //   loading(false);
  //   update();
  // }
  //

  ///=========================Submit Task===========================>

}

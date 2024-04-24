import 'dart:convert';
import 'dart:io';
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

  Rx<TaskerHomeModel> taskerHomeModelAll = TaskerHomeModel().obs;
  Rx<TaskerHomeModel> taskerHomeModelToday = TaskerHomeModel().obs;


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
      taskerHomeModelAll.value = TaskerHomeModel.fromJson(response.body);
       totalPage = jsonDecode(response.body['data']['attributes']['totalPages'].toString());
      currentPage = jsonDecode(response.body['data']['attributes']['page'].toString());
      print("=================$totalPage \n $currentPage");

      setRxRequestStatus(Status.completed);
      refresh();
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
      taskerHomeModelToday.value = TaskerHomeModel.fromJson(response.body);
      await  getTaskerHomeDataAll();
      refresh();
    }
  }

  ///==================== task Register ==========================>
   var loading=false.obs;
  taskRegister(String name, taskId, price) async {
    loading(true);
    var body = {"name": name, "taskId": taskId, "price": price};
    var response = await ApiClient.postData(ApiConstants.taskRegisterEndPoint, body);
    if (response.statusCode == 200) {
       taskRegId.value = response.body['data']['attributes']['_id'];
      print("==============================> id for submitted: $taskId");
      alreadyTaskRegister.add(taskId);
       registerTaskIdList.add(response.body['data']['attributes']["_id"]);
      alreadyTaskRegister.refresh();
    }
    loading(false);
    update();
  }


  ///=========================Submit Task===========================>

}

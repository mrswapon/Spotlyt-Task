import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../utils/app_constant.dart';

class TaskerHomeController extends GetxController {

  int page = 1;
  var totalPage=(-1);
  var currentPage=(-1);
  var taskRegId = "".obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaskerHomeDataAll();
    getTaskerHomeDataToday();
  }

  Rx<TaskerHomeModel> taskerHomeModelAll = TaskerHomeModel().obs;
  Rx<TaskerHomeModel> taskerHomeModelToday = TaskerHomeModel().obs;


  loadMore(){
    if(totalPage != currentPage){
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
    }
  }


  ///=========================get tasker home data Today=========================>
  getTaskerHomeDataToday() async {
    var response = await ApiClient.getData("${ApiConstants.taskerHomeEidPoint}?page=$page&type=others");

    if (response.statusCode == 200) {
      taskerHomeModelToday.value = TaskerHomeModel.fromJson(response.body);
      refresh();
    }
  }

  ///==================== task Register ==========================>
  taskRegister(String name, taskId, price) async {
    var body = {"name": name, "taskId": taskId, "price": price};
    var response = await ApiClient.postData(ApiConstants.taskRegisterEndPoint, body);
    if (response.statusCode == 200) {
       taskRegId.value = response.body['data']['attributes']['_id'];
      print("==============================> id for submitted: $taskId");
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
    }
  }


  ///=========================Submit Task===========================>
  submitTask(String id, File image) async {
    List<MultipartBody> multipartBody = image == null ? [] : [MultipartBody("image", image)];
    var body = {'submitTaskId': id};

    var respose = await ApiClient.putMultipartData(
        ApiConstants.taskRegisterEndPoint, body,
        multipartBody: multipartBody);

    if (respose.statusCode == 200 || respose.statusCode == 201) {
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
    }
  }
}

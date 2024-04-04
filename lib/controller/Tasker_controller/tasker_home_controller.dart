import 'dart:ffi';

import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../utils/app_constant.dart';

class TaskerHomeController extends GetxController{

 Rx<TaskerHomeModel> taskerHomeModel = TaskerHomeModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTaskerHomeData();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  getTaskerHomeData()async{
    var response = await ApiClient.getData(ApiConstants.taskerHomeEidPoint);

    if(response.statusCode == 200){
      print("===> repose : ${response.body}");
      taskerHomeModel.value = TaskerHomeModel.fromJson(response.body['data']);
    }
  }

}
import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_task_model.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../utils/app_constant.dart';

class TaskerTaskController extends GetxController{

  Rx<TaskerTaskModel> taskertaskModel = TaskerTaskModel().obs;
  RxBool isSelected = true.obs;
  RxString status = 'submitted'.obs;

  void setStatus(String newStatus) {
    status.value = newStatus;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    taskerTaskGet();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  taskerTaskGet()async{
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstants.allTaskGetApi("$status"));

    print('=====> tasker task response : ${response.statusCode} and ${response.body}');
    if(response.statusCode == 200){
      taskertaskModel.value = TaskerTaskModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
      refresh();
    }else {
      if(response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      }else{
        setRxRequestStatus(Status.error);
      }
    }
  }
}

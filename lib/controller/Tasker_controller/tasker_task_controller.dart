import 'package:get/get.dart';
import 'package:spotlyt_task/models/tasker_task_model.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

class TaskerTaskController extends GetxController{

  Rx<TaskerTaskModel> taskertaskModel = TaskerTaskModel().obs;
  RxBool isSelected = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   taskerTaskGet();
  }

  taskerTaskGet()async{
    var response = await ApiClient.getData(ApiConstants.allTaskGetApi("submitted"));

    if(response.statusCode == 200){
      taskertaskModel.value = TaskerTaskModel.fromJson(response.body);
      refresh();

    }
  }
}
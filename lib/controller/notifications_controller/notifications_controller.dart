import 'package:get/get.dart';
import 'package:spotlyt_task/models/notifications_model.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

class NotificationsController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotifications();
  }

  Rx<NotificationModel> notificationsModel = NotificationModel().obs;
  RxBool notificationsLoading = false.obs;
  getNotifications()async{
    notificationsLoading(true);
    var response = await ApiClient.getData(ApiConstants.notificationEndPoint);

    if(response.statusCode == 200){
      notificationsModel.value = NotificationModel.fromJson(response.body);
      notificationsLoading(false);
    }
  }
}
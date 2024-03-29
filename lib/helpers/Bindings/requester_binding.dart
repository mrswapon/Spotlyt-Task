import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/controller/requesterController/requester_home_controller.dart';

class InitialRequesterScreenBindings implements Bindings {

  InitialRequesterScreenBindings();

  @override
  void dependencies() {
    Get.put(() => ProfileController());
    Get.put(() => RequesterHomeController());
  }
}
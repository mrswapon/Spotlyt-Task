import 'package:get/get.dart';

import '../../controller/Profile_Controller/profile_controller.dart';

class InitialTaskerScreenBindings implements Bindings {

  InitialTaskerScreenBindings();

  @override
  void dependencies() {
    Get.put(() => ProfileController());
  }
}
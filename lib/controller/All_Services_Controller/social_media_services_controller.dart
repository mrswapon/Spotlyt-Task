import 'package:get/get.dart';
import '../../utils/app_icons.dart';
import '../../views/screens/Requester/requesterHome/controller/requester_home_controller.dart';

RequesterHomeController requesterHomeController = Get.put(RequesterHomeController());
class SocialMediaServicesController extends GetxController {

  RxInt selectedCategory = 0.obs;





  List<Map<String, dynamic>> categories = [
    {
      'name': requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].name,
      'icon': AppIcons.facebook,
    },
    {
      'name': requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[1].name,
      'icon': AppIcons.instagram,
    },
    {
      'name': requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[2].name,
      'icon': AppIcons.tiktok,
    },
  ];




  void setSelectedCategory(int index) {
    selectedCategory.value = index;
  }
}

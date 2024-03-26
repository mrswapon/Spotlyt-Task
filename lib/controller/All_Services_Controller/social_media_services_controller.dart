import 'package:get/get.dart';
import '../../utils/app_icons.dart';
import '../../views/screens/Requester/requesterHome/controller/requester_home_controller.dart';

RequesterHomeController requesterHomeController = Get.put(RequesterHomeController());
class SocialMediaServicesController extends GetxController {
  RxInt selectedCategory = 0.obs;


  List requestList = [
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[0].name,
      "per": "Per like",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[0].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[1].name,
      "per": "Per Follower",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[1].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[2].name,
      "per": "Per Comment",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[2].price
    },
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[3].name,
      "per": "Per views",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[3].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[4].name,
      "per": "Per Story",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].service?[4].price
    },
  ];


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

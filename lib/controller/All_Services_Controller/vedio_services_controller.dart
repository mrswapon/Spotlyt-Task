import 'package:get/get.dart';
import '../../utils/app_icons.dart';
import '../../views/screens/Requester/requesterHome/controller/requester_home_controller.dart';

RequesterHomeController requesterHomeController = Get.put(RequesterHomeController());
class VideoServicesController extends GetxController {
  RxInt selectedIndex = 0.obs;


  List requestList = [
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[0].name,
      "per": "Per views",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[0].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[1].name,
      "per": "Per like",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[1].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[2].name,
      "per": "Per Comment",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[2].price
    },
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[3].name,
      "per": "Per subscribe",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].service?[3].price
    },
  ];


  List<Map<String, dynamic>> categories = [
    {
      'name': requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].name,
      'icon': AppIcons.youtube,
    },
  ];




  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}

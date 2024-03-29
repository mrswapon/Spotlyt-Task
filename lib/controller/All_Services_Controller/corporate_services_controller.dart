import 'package:get/get.dart';
import '../../utils/app_icons.dart';
import '../../views/screens/Requester/requesterHome/controller/requester_home_controller.dart';


RequesterHomeController requesterHomeController = Get.put(RequesterHomeController());
class CorporateServicesController extends GetxController {
  RxInt selectedIndex = 0.obs;


  List requestList = [
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[0].name,
      "per": "Per survey",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[0].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[1].name,
      "per": "Per download",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[1].price
    },
    {
      "required": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[2].name,
      "per": "Per download",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[2].price
    },
    {"required": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[4].name,
      "per": "Per stream",
      "quantity": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].service?[4].price
    },
  ];


  List<Map<String, dynamic>> categories = [
    {
      'name': requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].name,
      'icon': AppIcons.corporateIcon,
    },
  ];




  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}

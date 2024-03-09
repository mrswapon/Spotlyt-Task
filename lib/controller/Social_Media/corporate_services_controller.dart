import 'package:get/get.dart';

import '../../utils/app_icons.dart';

class CorporateServicesController extends GetxController {
  RxInt selectedIndex = 0.obs;


  List requestList = [
    {"required": "Surveys",
      "per": "Per Survey",
      "quantity": "R-0.60"
    },
    {
      "required": "App Downloads",
      "per": "Per Download",
      "quantity": "R-0.60"
    },
    {
      "required": "Game Downloads",
      "per": "Per Download",
      "quantity": "R-0.60"
    },
    {"required": "Request Streaming",
      "per": "Per Stream",
      "quantity": "R-0.60"
    },
  ];


  List<Map<String, dynamic>> categories = [
    {
      'name': 'Corporate',
      'icon': AppIcons.corporateIcon,
    },
  ];




  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

}

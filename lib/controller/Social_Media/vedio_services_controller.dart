import 'package:get/get.dart';

import '../../utils/app_icons.dart';

class VideoServicesController extends GetxController {
  RxInt selectedIndex = 0.obs;


  List requestList = [
    {"required": "Request views",
      "per": "Per views",
      "quantity": "R-0.60"
    },
    {
      "required": "Request Likes",
      "per": "Per like",
      "quantity": "R-0.60"
    },
    {
      "required": "Request comments",
      "per": "Per Comment",
      "quantity": "R-0.60"
    },
    {"required": "Request Subscriber",
      "per": "Per subscribe",
      "quantity": "R-0.60"
    },
  ];


  List<Map<String, dynamic>> categories = [
    {
      'name': 'Youtube',
      'icon': AppIcons.youtube,
    },
  ];




  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

}

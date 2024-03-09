import 'package:get/get.dart';

import '../../utils/app_icons.dart';

class SocialMediaServicesController extends GetxController {
  RxInt selectedIndex = 0.obs;


  List requestList = [
    {"required": "Request likes", "per": "Per like", "quantity": "R-0.60"},
    {
      "required": "Request followers",
      "per": "Per Follower",
      "quantity": "R-0.60"
    },
    {
      "required": "Request comments",
      "per": "Per Comment",
      "quantity": "R-0.60"
    },
    {"required": "Request views", "per": "Per views", "quantity": "R-0.60"},
    {
      "required": "Request sharing to story",
      "per": "Per Story",
      "quantity": "R-0.60"
    },
  ];


  List<Map<String, dynamic>> categories = [
    {
      'name': 'Facebook',
      'icon': AppIcons.facebook,
    },
    {
      'name': 'Instagram',
      'icon': AppIcons.instagram,
    },
    {
      'name': 'Tiktok',
      'icon': AppIcons.tiktok,
    },
  ];




  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

}

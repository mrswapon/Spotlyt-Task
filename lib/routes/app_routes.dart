import 'package:get/get.dart';
import 'package:spotlyt_task/views/screens/auth/selectroleScreen/selectrole_screen.dart';

class AppRoutes {
  static const String selectroleScreen = "/selectrole_screen.dart";

  static List<GetPage> get routes => [
        GetPage(name: selectroleScreen, page: () => SelectroleScreen()),
      ];
}

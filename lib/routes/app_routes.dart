import 'package:get/get.dart';
import '../views/screens/auth/selectroleScreen/selectrole_screen.dart';
import '../views/screens/auth/signUpScreen/sign_up_screen.dart';

class AppRoutes {
  static const String selectroleScreen = "/selectrole_screen.dart";
  static const String signUpScreen = "/sign_up_screen.dart";

  static List<GetPage> get routes => [
        GetPage(name: selectroleScreen, page: () => SelectroleScreen()),
        GetPage(name: signUpScreen, page: () => SignUpScreen()),
      ];
}

import 'package:get/get.dart';
import '../views/screens/auth/selectroleScreen/selectrole_screen.dart';
import '../views/screens/auth/signInScreen/sign_in_screen.dart';
import '../views/screens/auth/signUpScreen/sign_up_screen.dart';
import '../views/screens/auth/verifyOTPScreen/verify_otp_screen.dart';
import '../views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/screens/services/services_screen.dart';

class AppRoutes {
  static const String selectroleScreen = "/selectrole_screen.dart";
  static const String signUpScreen = "/sign_up_screen.dart";
  static const String verifyOtpScreen = "/verify_otp_screen.dart";
  static const String signInScreen = "/sign_in_screen.dart";
  static const String servicesScreen = "/ServicesScreen.dart";
  static const String bottomNavBar = "/BottomNavBar.dart";

  static List<GetPage> get routes => [
        GetPage(name: selectroleScreen, page: () => SelectroleScreen()),
        GetPage(name: signUpScreen, page: () => SignUpScreen()),
        GetPage(name: verifyOtpScreen, page: () => VerifyOtpScreen()),
        GetPage(name: signInScreen, page: () => SignInScreen()),
        GetPage(name: servicesScreen, page: () => ServicesScreen()),
        GetPage(name: bottomNavBar, page: () => BottomNavBar()),
      ];
}

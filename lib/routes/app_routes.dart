import 'package:get/get.dart';
import '../views/screens/Notification/notification_screen.dart';
import '../views/screens/Task_details/task_details_screen.dart';
import '../views/screens/auth/forgotPasswordScreen/forgot_password_screen.dart';
import '../views/screens/auth/resetPasswordScreen/reset_password_screen.dart';
import '../views/screens/auth/selectroleScreen/selectrole_screen.dart';
import '../views/screens/auth/signInScreen/sign_in_screen.dart';
import '../views/screens/auth/signUpScreen/sign_up_screen.dart';
import '../views/screens/auth/verifyOTPScreen/verify_otp_screen.dart';
import '../views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/screens/payments/payment_screen.dart';
import '../views/screens/services/corporate_servies_screen.dart';
import '../views/screens/services/media_services_screen.dart';
import '../views/screens/services/video_servies_screen.dart';
import '../views/screens/settings/aboutusScreen/aboutus_screen.dart';
import '../views/screens/settings/changePasswordScreen/change_password_screen.dart';
import '../views/screens/settings/privacyPolicyScreen/privacy_policy_screen.dart';
import '../views/screens/settings/settingsScreen/setting_screen.dart';
import '../views/screens/settings/termsConditionScreen/terms_condition_screen.dart';
import '../views/screens/splashScreen/splash_screen.dart';


class AppRoutes {
  static const String selectroleScreen = "/selectrole_screen.dart";
  static const String signUpScreen = "/sign_up_screen.dart";
  static const String verifyOtpScreen = "/verify_otp_screen.dart";
  static const String signInScreen = "/sign_in_screen.dart";
  static const String servicesScreen = "/ServicesScreen.dart";
  static const String bottomNavBar = "/BottomNavBar.dart";
  static const String videoServicesScreen = "/VideoServicesScreen.dart";
  static const String corporateServicesScreen = "/CorporateServicesScreen.dart";
  static const String forgotPasswordScreen = "/forgot_password_screen.dart";
  static const String resetPasswordScreen = "/reset_password_screen.dart";
  static const String settingsScreen = "/settings_screen.dart";
  static const String changePasswordScreen = "/change_password_screen.dart";
  static const String privacyPolicyScreen = "/privacy_policy_screen.dart";
  static const String termsConditionScreen = "/terms_condition_screen.dart";
  static const String aboutusScreen = "/aboutus_screen.dart";
  static const String splashScreen = "/splash_screen.dart";
  static const String paymentScreen = "/PaymentScreen.dart";
  static const String notificationScreen = "/NotificationScreen.dart";
  static const String taskDetailsScreen = "/TaskDetailsScreen.dart";


  static List<GetPage> get routes => [
        GetPage(name: selectroleScreen, page: () => SelectroleScreen()),
        GetPage(name: signUpScreen, page: () => SignUpScreen()),
        GetPage(name: verifyOtpScreen, page: () => VerifyOtpScreen()),
        GetPage(name: signInScreen, page: () => SignInScreen()),
        GetPage(name: servicesScreen, page: () => MediaServicesScreen()),
        GetPage(name: bottomNavBar, page: () => BottomNavBar()),
        GetPage(name: videoServicesScreen, page: () => VideoServicesScreen()),
        GetPage(name: corporateServicesScreen, page: () => CorporateServicesScreen()),
        GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
        GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
        GetPage(name: settingsScreen, page: () => SettingsScreen()),
        GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
        GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
        GetPage(name: termsConditionScreen, page: () => TermsConditionScreen()),
        GetPage(name: aboutusScreen, page: () => AboutusScreen()),
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: paymentScreen, page: () => PaymentScreen()),
        GetPage(name: notificationScreen, page: () => NotificationScreen()),
        GetPage(name: taskDetailsScreen, page: () => TaskDetailsScreen()),
      ];
}

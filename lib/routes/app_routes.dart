import 'package:get/get.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerTaskScreen/task_details.dart';
import '../helpers/Bindings/requester_binding.dart';
import '../views/screens/Add_Interest/add_interest_screen.dart';
import '../views/screens/Invite_Earn/invite_earn_screen.dart';
import '../views/screens/Invite_Earn/submit_refer.dart';
import '../views/screens/Notification/notification_screen.dart';
import '../views/screens/ProfileScreen/personalInformationScreen/personal_information_screen.dart';
import '../views/screens/ProfileScreen/profile_screen.dart';
import '../views/screens/ProfileScreen/updateProfileScreen/update_profile_screen.dart';
import '../views/screens/Requester/requesterTaskScreen/requester_task_screen.dart';
import '../views/screens/Requester/requester_Task_details/requester_task_details_screen.dart';
import '../views/screens/Requester/requester_bottom_nav_bar/requester_bottom_nav_bar.dart';
import '../views/screens/Requester/services/services_screen.dart';
import '../views/screens/Tasker/submitTaskScreen/submit_task_screen.dart';
import '../views/screens/Tasker/taskerBottomNavBar/tasker_bottom_nav_bar.dart';
import '../views/screens/Tasker/taskerHomeScreen/InnerWidgets/home_card_details.dart';
import '../views/screens/Tasker/taskerTaskDetails/tasker_task_details_screen.dart';
import '../views/screens/Tasker/todayOrAll_task/today_task_screen.dart';
import '../views/screens/Tasker/verifyScreen/verify_screen.dart';
import '../views/screens/Tasker/wallet/tasker_wallet.dart';
import '../views/screens/Tasker/wallet/withdraw_balance_screen.dart';
import '../views/screens/Tasker/wallet/withdrawal_history.dart';
import '../views/screens/auth/forgotPasswordScreen/forgot_password_screen.dart';
import '../views/screens/auth/resetPasswordScreen/reset_password_screen.dart';
import '../views/screens/auth/signInScreen/sign_in_screen.dart';
import '../views/screens/auth/signUpScreen/sign_up_screen.dart';
import '../views/screens/auth/verifyOTPScreen/verify_otp_screen.dart';
import '../views/screens/payments/cancel_payment.dart';
import '../views/screens/payments/failed_payment.dart';
import '../views/screens/payments/success_payment.dart';
import '../views/screens/settings/aboutusScreen/aboutus_screen.dart';
import '../views/screens/settings/changePasswordScreen/change_password_screen.dart';
import '../views/screens/settings/privacyPolicyScreen/privacy_policy_screen.dart';
import '../views/screens/settings/settingsScreen/setting_screen.dart';
import '../views/screens/settings/termsConditionScreen/terms_condition_screen.dart';
import '../views/screens/splashScreen/splash_screen.dart';


class AppRoutes {
  static const String signUpScreen = "/sign_up_screen.dart";
  static const String verifyOtpScreen = "/verify_otp_screen.dart";
  static const String signInScreen = "/sign_in_screen.dart";
  static const String servicesScreen = "/ServicesScreen.dart";
  static const String requesterBottomNavBar = "/RequesterBottomNavBar.dart";
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
  static const String requesterTaskScreen = "/RequesterTaskScreen.dart";
  static const String requesterTaskDetailsScreen = "/RequesterTaskDetailsScreen.dart";
  static const String personalInformationScreen = "/personal_information_screen.dart";
  static const String profileScreen = "/tasker_profile_screen.dart";
  static const String updateProfileScreen = "/update_profile_screen.dart";
  static const String inviteEarnScreen = "/InviteEarnScreen.dart";
  static const String addInterestScreen = "/AddInterestScreen.dart";
  static const String taskerProfileScreen = "/tasker_profile_screen.dart";
  static const String submitTaskScreen = "/submit_task_screen.dart";
  static const String taskerBottomNavBar = "/tasker_bottom-nav_bar.dart";
  static const String verifyScreen = "/verify_screen.dart";
  static const String taskerTaskDetailsScreen = "/tasker_task_details_screen.dart";
  static const String homeCardDetails = "/HomeCardDetails.dart";
  static const String todayOrAllTaskScreen = "/TodayOrAllTaskScreen.dart";
  static const String taskerWalletScreen = "/TaskerWalletScreen.dart";
  static const String withdrawalHistory = "/withdrawal_history.dart";
  static const String withdrawBalanceScreen = "/withdraw_balance_screen";
  static const String successPayment = "/success_payment";
  static const String cancelPayment = "/cancel_payment";
  static const String failedPayment = "/failed_payment";
  static const String submitReferCode = "/submit_refer_code";
  static const String taskDetails = "/tasks_details";


  static List<GetPage> get routes => [
        GetPage(name: signUpScreen, page: () => SignUpScreen()),
        GetPage(name: verifyOtpScreen, page: () => VerifyOtpScreen()),
        GetPage(name: signInScreen, page: () => SignInScreen()),
        GetPage(name: servicesScreen, page: () => MediaServicesScreen()),
        GetPage(name: requesterBottomNavBar, page: () => RequesterBottomNavBar(),binding:InitialRequesterScreenBindings()),
        GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
        GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
        GetPage(name: settingsScreen, page: () => SettingsScreen()),
        GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
        GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
        GetPage(name: termsConditionScreen, page: () => TermsConditionScreen()),
        GetPage(name: aboutusScreen, page: () => AboutusScreen()),
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: personalInformationScreen, page: () => PersonalInformationScreen(), transition: Transition.cupertinoDialog, transitionDuration: const Duration(milliseconds: 450)),
        GetPage(name: profileScreen, page: () => ProfileScreen()),
        GetPage(name: updateProfileScreen, page: () => UpdateProfileScreen(), transition: Transition.cupertinoDialog, transitionDuration: const Duration(milliseconds: 450)),
        GetPage(name: notificationScreen, page: () => NotificationScreen()),
        GetPage(name: requesterTaskScreen, page: () => RequesterTaskScreen()),
        GetPage(name: requesterTaskDetailsScreen, page: () => RequesterTaskDetailsScreen()),
        //GetPage(name: personalInformationScreen, page: () => PersonalInformationScreen()),
        GetPage(name: inviteEarnScreen, page: () => InviteEarnScreen()),
        GetPage(name: addInterestScreen, page: () => AddInterestScreen()),
         // GetPage(name: taskerProfileScreen, page: () => TaskerProfileScreen()),
        GetPage(name: submitTaskScreen, page: () => SubmitTaskScreen()),
        GetPage(name: taskerBottomNavBar, page: () => TaskerBottomNavBar()),
        GetPage(name: verifyScreen, page: () => VerifyScreen()),
        GetPage(name: taskerTaskDetailsScreen, page: () => TaskerTaskDetailsScreen()),
         GetPage(name:taskDetails, page: () =>  TaskDetailsScreen()),
         GetPage(name: homeCardDetails, page: () => HomeCardDetails()),
        GetPage(name: todayOrAllTaskScreen, page: () => TodayOrAllTaskScreen()),
        GetPage(name: taskerWalletScreen, page: () => TaskerWalletScreen()),
        GetPage(name: withdrawalHistory, page: () => WithdrawalHistory()),
        GetPage(name: withdrawBalanceScreen, page: () => WithdrawBalanceScreen()),
        GetPage(name: successPayment, page: () => SuccessPayment()),
        GetPage(name: cancelPayment, page: () => CancelPayment()),
        GetPage(name: failedPayment, page: () => FailedPayment()),
        GetPage(name: submitReferCode, page: () => SubmitReferCodeScreen()),
  ];
}

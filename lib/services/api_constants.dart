class ApiConstants{
  static const String baseUrl = "https://api.spotlyt.co.za/v1";
  static const String imageBaseUrl="https://api.spotlyt.co.za/";



  static const String signUpEndPoint = "/auth/register";
  static const String forgot = "/auth/forgot-password";
  static const String otpVerifyEndPoint = "/auth/verify-email";
  static const String requesterTaskService = "/service";
  static const String loginEndPoint = "/auth/login";
  static const String forgotPasswordEndPoint = "/auth/forgot-password";
  static const String changePasswordEndPoint = "/auth/change-password";
  static const String resetPasswordEndPoint = "/auth/reset-password";
  static const String nidverifyEndPoint = "/users/verifyNid";
  static const String inviteandEernEndPoint = "/referral/my";
  static const String withdrawEidPoint = "/withdrawal";
  static const String requesterSubmitTaskEndPoint = "/tasks";
  static  String taskRegisterEndPoint = "/tasks/register";
  static String allTaskGetApi(String status)=>"/tasks/register?status=$status";
  static const String privacyPolicyEndPoint = "/privacy/";
  static const String termsConditionsEndPoint = "/terms";
  static const String aboutUsEndPoint = "/about";
  static  String profileEndPoint(String id) => "/users/$id";
  static String interestApi="/users/interest";
  static String walletEndPoint = "/withdrawal/my";
  static String interestEndPoint = "/users/interest";
  static String referralCodeSubmitApi = "/referral";
  static String referralAmount = "/referral/amount";
  static String notificationEndPoint = "/notification";

  ///  requester task api
  static String requesterTaskApi(String status,String page)=>"/tasks?status=$status&page=$page";

  ///======================tasker end point==========================>
  static const String taskerHomeEidPoint = "/tasks/home";
}
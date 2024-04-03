class ApiConstants{
  static const String baseUrl = "http://103.145.138.54:3232";
  static const String signUpEndPoint = "/v1/auth/register";
  static const String forgot = "/v1/auth/forgot-password";
  static const String otpVerifyEndPoint = "/v1/auth/verify-email";
  static const String requesterTaskService = "/v1/tasks/service";
  static const String loginEndPoint = "/v1/auth/login";
  static const String forgotPasswordEndPoint = "/v1/auth/forgot-password";
  static const String changePasswordEndPoint = "/v1/auth/change-password";
  static const String resetPasswordEndPoint = "/v1/auth/reset-password";
  static const String nidverifyEndPoint = "/v1/users/verifyNid";
  static const String inviteandEernEndPoint = "/v1/referral/my";
  static const String withdrawEidPoint = "/v1/withdrawal";
  static const String requesterSubmitTaskEndPoint = "";
  static const String privacyPolicyEndPoint = "/v1/privacy/";
  static  String profileEndPoint(String id) => "/v1/users/$id";
}
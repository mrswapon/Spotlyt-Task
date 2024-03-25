import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_strings.dart';

import '../../helpers/Bindings/prefs_helper.dart';
import '../../services/api_checker.dart';
import '../../services/api_client.dart';

class AuthController extends GetxController {




  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final conPasswordCtrl = TextEditingController();
  RxBool isSelectedRole = true.obs;
  RxString role = "client".obs;
  var signUpLoading = false.obs;
  var token = "";

  ///==================role selected==============>
  void selectRole(String selectedRole) {
    role.value = selectedRole;
  }


  ///<=============Sign Up===========>
  handleSignUp() async {
    signUpLoading(true);
    try {
      Map<String, dynamic> body = {
        "fullName": fullNameCtrl.text.trim(),
        "email": emailCtrl.text.trim(),
        "password": passwordCtrl.text,
        "role": "${role.value}",
      };

      print("=================>ROLE ${role.value}");
      print("===================> ${body}");

      var headers = {'Content-Type': 'application/json'};

      Response response = await ApiClient.postData(
          ApiConstants.signUpEndPoint, jsonEncode(body),
          headers: headers);

      print("============> ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: response.body['message']);
        Get.toNamed(AppRoutes.verifyOtpScreen, parameters: {
          "email": emailCtrl.text.trim(),
          "screenType": "signup",
        });

        fullNameCtrl.clear();
        emailCtrl.clear();
        passwordCtrl.clear();
        conPasswordCtrl.clear();
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> error : $e");
      print("===> error : $s");
    }
    signUpLoading(false);
  }




  /// <====================== Sign in screen =================->
  TextEditingController signInPassCtrl = TextEditingController();
  TextEditingController signInEmailCtrl = TextEditingController();
  var signInLoading =false.obs;

  handleSignIn()async{
    signInLoading(true);
    var headers = {
      //'Content-Type': 'application/x-www-form-urlencoded'
      'Content-Type': 'application/json'
    };
    Map<String,dynamic> body={
      'email': signInEmailCtrl.text.trim(),
      'password': signInPassCtrl.text.trim()
    };
    Response response= await ApiClient.postData(ApiConstants.loginEndPoint,json.encode(body),headers: headers);
    print("====> ${response.body}");
    if(response.statusCode==200){
      // if(response.body['data']['attributes']['role']!="client"&&response.body['data']['attributes']['_id'] != "65fd4000d68df19360700e26"){
      await  PrefsHelper.setString(AppString.bearerToken,response.body['data']['attributes']['tokens']['access']['token']);

      await PrefsHelper.setBool(AppString.isLogged, true);
      var roles = await PrefsHelper.getString(AppString.role);
      print("=============roles : $roles");
      if(roles== "client"){
        Get.offAllNamed(AppRoutes.addInterestScreen);
      }else{
        Get.offAllNamed(AppRoutes.taskerBottomNavBar);
      }
      print("====================================================Sagor ");
      signInEmailCtrl.clear();
      signInPassCtrl.clear();
      // }
    }else{
      //  ApiChecker.checkApi(response);
      Fluttertoast.showToast(msg:response.statusText??"");
    }
    signInLoading(false);
  }




  /// ============== resend otp================>
  var resendOtpLoading = false.obs;
  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.forgot, json.encode(body),
        headers: header);
    print("===> ${response.body}");
    if (response.statusCode == 200) {
    } else {
      Fluttertoast.showToast(
          msg: response.statusText ?? "",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    }
    resendOtpLoading(false);
  }



  ///==================otp very=====================>
  TextEditingController otpCtrl = TextEditingController();
  var verifyLoading = false.obs;

  handleOtpVery(
      {required String email,
      required String otp,
      required String type}) async {
    try {
      var body = {'oneTimeCode': otp, 'email': email};
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      verifyLoading(true);
      Response response = await ApiClient.postData(
          ApiConstants.otpVerifyEndPoint, body,
          headers: headers);
      print("============${response.body} and ${response.statusCode}");
      if (response.statusCode == 200) {
        await PrefsHelper.setString(AppString.role, response.body["data"]['attributes']['user']['role']);
        var role = response.body["data"]['attributes']['user']['role'];
        print("===> role : $role");
         otpCtrl.clear();

        if( type ==  "forgetPasswordScreen"){
          Get.toNamed(AppRoutes.resetPasswordScreen, parameters: {"email" : email});
        }else{
          Get.offAllNamed(AppRoutes.signInScreen);
        }

      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> e : $e");
      print("===> s : $s");
    }
    verifyLoading(false);
  }



  ///==================forgot pass word===============>
  TextEditingController forgetEmailTextCtrl=TextEditingController();
  TextEditingController forgetConfirmPassTextCtrl=TextEditingController();
  TextEditingController forgetNewPassTextCtrl=TextEditingController();
  var forgotLoading = false.obs;

  handleForget()async{
    forgotLoading(true);
    var body = {
      "email":forgetEmailTextCtrl.text.trim(),
    };
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var response= await ApiClient.postData(ApiConstants.forgotPasswordEndPoint, json.encode(body),headers: headers);
    if(response.statusCode==200 || response.statusCode == 201){

      Get.toNamed(AppRoutes.verifyOtpScreen, parameters: {
        "email": forgetEmailTextCtrl.text.trim(),
        "screenType": "forgetPasswordScreen",
      });

      forgetEmailTextCtrl.clear();
    }else{
      ApiChecker.checkApi(response);
    }
    forgotLoading(false);
  }


  ///====================handle Change password=========================>
  var changeLoading = false.obs;
  TextEditingController oldPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  handleChangePassword(String oldPassword, String newPassword) async {
    changeLoading(true);
    var body = {"oldPassword": oldPassword, "newPassword": newPassword};

    var response = await ApiClient.postData(ApiConstants.changePasswordEndPoint, json.encode(body));
    print("===============> ${response.body}");
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: response.body['message'],toastLength:Toast.LENGTH_LONG,gravity: ToastGravity.CENTER,backgroundColor:Colors.green,textColor:Colors.white);
      Get.offAllNamed(AppRoutes.signInScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    changeLoading(false);
  }




  /// <-------------------------- reset password --------------->
  var resetPasswordLoading = false.obs;

  resetPassword(String email, String password) async {
    print("=======> $email, and $password");
    resetPasswordLoading(true);
    var body = {"email": email, "password": password};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.resetPasswordEndPoint, json.encode(body),
        headers: header);
    if (response.statusCode == 200){
      showDialog(context: Get.context!,
          barrierDismissible:false,
          builder:(_)=> AlertDialog(
            title: const Text("Password Changed!"),
            content: const Text("Your password has been changed successfully."),
            actions: [
              TextButton(
                  onPressed:(){
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                  }, child:const Text("Ok"))
            ],
          ));

    } else {
      debugPrint("error set password ${response.statusText}");
      Fluttertoast.showToast(msg: "${response.statusText}",);
    }
    resetPasswordLoading(false);
  }


}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../services/api_checker.dart';
import '../../services/api_client.dart';

class AuthController extends GetxController{

  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final conPasswordCtrl = TextEditingController();
  RxBool isSelectedRole = true.obs;



  var signUpLoading = false.obs;
  var token="";

  RxString role = "".obs;

  void updateRole() {
    if (isSelectedRole.value == true) {
      role.value = "client";
    } else {
      role.value = "employee";
    }
  }

  ///<=============Sign Up==========>
  handleSignUp() async {
    signUpLoading(true);

    try{
      Map<String, dynamic> body = {
        "fullName":fullNameCtrl.text.trim(),
        "email":emailCtrl.text.trim(),
        "password":passwordCtrl.text,
        "role":"${role.value}",
      };


      print("=========================================================> ${role.value}");
      print("=========================================================> ${body}");

      var headers = {'Content-Type': 'application/json'};


      Response response = await ApiClient.postData(
          ApiConstants.signUpEndPoint, jsonEncode(body),
          headers: headers);

      print("=========================================================> ${response.body} and ==> ${response.statusCode}");

      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: response.body['message']);
        // token = response.body['token'];
        // debugPrint("====> token : $token");
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



    }catch(e,s){
      print("===> error : $e");
      print("===> error : $s");
    }
    signUpLoading(false);
  }





  ///  resend otp

  var resendOtpLoading = false.obs;

  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstants.forgot, json.encode(body),
        headers: header);
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

  // var verifyLoading = false.obs;
  //
  // verifyEmail(
  //     Map<String, String?> data,
  //     String code,
  //     ) async {
  //   verifyLoading(true);
  //   var body = {"email": data['email'], "code": code};
  //   Map<String, String> header = {'Content-Type': 'application/json'};
  //   var response = await ApiClient.postData(
  //       ApiConstants.verifyCode, json.encode(body),
  //       headers: header);
  //   if (response.statusCode == 200) {
  //     if (data['screenType'] == "forgot") {
  //       Get.toNamed(AppRoutes.setPasswordScreen, arguments: data['email']);
  //     } else {
  //       Get.offAllNamed(AppRoutes.bottomNavBar);
  //     }
  //   } else {
  //     Fluttertoast.showToast(msg: response.statusText ?? "");
  //   }
  //   verifyLoading(false);
  // }



  TextEditingController otpCtrl = TextEditingController();
  var verifyLoading = false.obs;

  handleOtpVery({required String email, required String otp, required String type}) async {
    try{
      var body = {'oneTimeCode': otp, 'email': email};
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      verifyLoading(true);
      Response response = await ApiClient.postData(
          ApiConstants.otpVerifyEndPoint, body,
          headers: headers);
      print("==========================${response.body} and ${response.statusCode}");
      if (response.statusCode == 200) {
        otpCtrl.clear();
        Get.offAllNamed(AppRoutes.signInScreen);
      } else {
        ApiChecker.checkApi(response);
      }

    }catch(e,s){
      print("===> e : $e");
      print("===> s : $s");
    }
    verifyLoading(false);
  }




}
import 'dart:convert';

import 'package:flutter/cupertino.dart';
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


  var signUpLoading = false.obs;
  var token="";
  RxString role = "".obs;

  ///<=============Sign Up==========>
  handleSignUp() async {
    signUpLoading(true);
    Map<String, dynamic> body = {
      "fullName": fullNameCtrl.text.trim(),
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text,
      "role" : "$role",
    };

    var headers = {'Content-Type': 'application/json'};
    Response response = await ApiClient.postData(
        ApiConstants.signUpEndPoint, jsonEncode(body),
        headers: headers);

    if (response.statusCode == 201) {
      Fluttertoast.showToast(msg: response.body['message']);
      token = response.body['token'];
      Get.toNamed(AppRoutes.verifyOtpScreen, parameters: {
        "email": emailCtrl.text.trim(),
        "screenType": "", // OptScreenType.signupotp.name,
      });

      fullNameCtrl.clear();
      // dobCtrl.clear();
      // selectedGender.value = 0;
      emailCtrl.clear();
      passwordCtrl.clear();
      conPasswordCtrl.clear();
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading(false);
  }



}
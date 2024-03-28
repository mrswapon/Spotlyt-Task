import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/models/profile_models.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/utils/app_constant.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import 'package:spotlyt_task/utils/app_strings.dart';

import '../../services/api_checker.dart';
import '../../services/api_constants.dart';
import '../../utils/app_colors.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }


  ProfileModel? profileModel;
  RxBool isProfileLoading = false.obs;

  getProfileData() async {
    isProfileLoading(true);
    try {
      String id = await PrefsHelper.getString(AppConstants.id);
      var response = await ApiClient.getData(ApiConstants.profileEndPoint(id),
        );
      print("=============response : ${response.body}");
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.body);
      } else {
        Get.snackbar(
            response.statusCode.toString(), response.statusText ?? "error");
      }
      update();
    } catch (e, s) {
      print("=============== error e: $e");
      print("=============== error s: $s");
    }
    isProfileLoading(false);
  }

  ///======================update profile============================>
  var loading = false.obs;

  editProfile(
      String name, phoneNumber, nidNumber, address, File?  image, dateOfBirth) async {
    var id = await PrefsHelper.getString(AppConstants.id);
    List <MultipartBody> multipartBody =image==null?[]:[MultipartBody("image", image)];
    Map<String, String> body = {
      "fullName": name,
      "address": address,
      "dataOfBirth": "$dateOfBirth",
      "interest": "",
      "isInterest": "false",
      "phoneNumber": phoneNumber,
      "nidNumber": nidNumber,
    };

    try {
      var response = await ApiClient.patchMultipartData(
         ApiConstants.profileEndPoint(id), body,
           multipartBody:multipartBody,);
      print(
          "===========response body : ${response.body} \nand status code : ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        update();
        onInit();
      }
    } catch (e, s) {
      print("===> error e: $e");
      print("===> error s: $s");
    }
  }

}

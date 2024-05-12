import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/models/profile_models.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_checker.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/utils/app_constant.dart';
import '../../services/api_constants.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  RxBool isProfileLoading = false.obs;
  getBalance() async {
    String id = await PrefsHelper.getString(AppConstants.id);
    var response = await ApiClient.getData(
      ApiConstants.profileEndPoint(id),
    );
    print("=============response : ${response.body}");
    if (response.statusCode == 200) {
      var demoData = ProfileModel.fromJson(response.body['data']['attributes']);
      profileModel.value.rand = demoData.rand;
      profileModel.refresh();
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  getProfileData() async {
    setRxRequestStatus(Status.loading);
    String id = await PrefsHelper.getString(AppConstants.id);
    var response = await ApiClient.getData(
      ApiConstants.profileEndPoint(id),
    );
    print("=============response : ${response.body}");
    if (response.statusCode == 200) {
      profileModel.value =
          ProfileModel.fromJson(response.body['data']['attributes']);
      profileModel.refresh();
      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
    update();
  }

  ///======================update profile============================>
  var loading = false.obs;

  editProfile(String name, phoneNumber, nidNumber, address, File? image,
      dateOfBirth) async {
    var id = await PrefsHelper.getString(AppConstants.id);
    List<MultipartBody> multipartBody =
        image == null ? [] : [MultipartBody("image", image)];
    Map<String, String> body = {
      "fullName": name,
      "address": address,
      "dataOfBirth": "$dateOfBirth",
      "phoneNumber": phoneNumber,
      "nidNumber": nidNumber,
    };

    var response = await ApiClient.patchMultipartData(
      ApiConstants.profileEndPoint(id),
      body,
      multipartBody: multipartBody,
    );
    print(
        "===========response body : ${response.body} \nand status code : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value =
          ProfileModel.fromJson(response.body['data']['attributes']);
      profileModel.refresh();
      Get.back();
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }
  }

  TextEditingController nidCtrl = TextEditingController();
  handleNidVerify() async {
    var bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {'nidNumber': nidCtrl.text.toString()};

    var response = await ApiClient.postData(
        ApiConstants.nidverifyEndPoint, body,
        headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value =
          ProfileModel.fromJson(response.body['data']['attributes']);
      profileModel.refresh();
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
    } else {
      ApiChecker.checkApi(response);
    }
  }
}

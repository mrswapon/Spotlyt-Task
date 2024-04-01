
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/models/profile_models.dart';
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

  var role;




  final rxRequestStatus = Status.loading.obs;
  Rx<ProfileModel> profileModel = ProfileModel().obs;
  RxBool isProfileLoading = false.obs;

  getProfileData() async {
    rxRequestStatus.value = Status.loading;
    isProfileLoading(true);
    try {
      String id = await PrefsHelper.getString(AppConstants.id);
       role = await PrefsHelper.getString(AppConstants.role);
      var response = await ApiClient.getData(ApiConstants.profileEndPoint(id),
        );
      print("=============response : ${response.body}");
      if (response.statusCode == 200) {
        profileModel.value = ProfileModel.fromJson(response.body['data']['attributes']);
        rxRequestStatus.value = Status.completed;
        profileModel.refresh();


      } else {
        if(response.statusText == ApiClient.noInternetMessage){
          rxRequestStatus.value = Status.internetError;
        }else{
          rxRequestStatus.value = Status.error;
        }
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
        profileModel.value = ProfileModel.fromJson(response.body['data']['attributes']);
        profileModel.refresh();
        Get.back();
        Get.back();
      }
    } catch (e, s) {
      print("===> error e: $e");
      print("===> error s: $s");
    }
  }

}

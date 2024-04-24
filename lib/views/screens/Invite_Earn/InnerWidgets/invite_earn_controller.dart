import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_checker.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_constant.dart';

import '../../../../controller/Profile_Controller/profile_controller.dart';

class InviteAndEernController extends GetxController {
   TextEditingController referCodeCtrl= TextEditingController();
   final ProfileController _profileController = Get.put(ProfileController());

var loading=false.obs;
   submit(String code)async{
      loading(true);



      var body={
         "referralCode": code,
      };
      var response = await ApiClient.postData(ApiConstants.referralCodeSubmitApi,body);
      if(response.statusCode==200 || response.statusCode==201){
         _profileController.profileModel.value.claimedReferralCode=code;
         debugPrint(  _profileController.profileModel.value.claimedReferralCode);
         _profileController.profileModel.refresh();
         refresh();
         Get.back();
         Get.back();

      }else{
         ApiChecker.checkApi(response);
      }
      loading(false);
   }






   RxMap referralData = {}.obs;


   getReferralAmount()async{
      var response = await ApiClient.getData(ApiConstants.referralAmount);

      if(response.statusCode == 200){
         var data = response.body['data']['attributes'];
         referralData.value = data;
      }
   }


   @override
   void onInit() {
      // TODO: implement onInit
      super.onInit();
      getReferralAmount();
   }

}

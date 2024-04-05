import 'dart:convert';

import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_constant.dart';

class InviteAndEernController extends GetxController {
  var referrals = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    haandleInviteAndEern();
  }


  haandleInviteAndEern() async {


    var response = await ApiClient.getData(ApiConstants.inviteandEernEndPoint);

    print("========> invite and earn : ${response.body}");
    if (response.statusCode == 200) {
      var responseData = response.body;

      var data = responseData['data']['attributes']['referrals'][0]['userId']['referralCode'];
      print("===> $data");
      referrals.value =  data;
      print("====> data: $data");
    }
  }
}

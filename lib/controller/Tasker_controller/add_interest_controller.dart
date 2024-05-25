import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../helpers/prefs_helper.dart';
import '../../models/interest_model.dart';
import '../../routes/app_routes.dart';
import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';

class AddInterestController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInterest();
    addInterestsList();
  }

  RxList<Interest> interestList = <Interest>[].obs;
  RxList<Interest> selectInterestList = <Interest>[].obs;

  var loading = false.obs;

  getInterest() async {
    loading(true);
    var response = await ApiClient.getData(ApiConstants.interestApi);
    if (response.statusCode == 200) {
      interestList.value = List<Interest>.from(response.body['data']
              ['attributes']
          .map((item) => Interest.fromJson(item)));
      loading(false);
    } else {
      ApiChecker.checkApi(response);
    }
  }

  RxBool addInterestLoading = false.obs;
  addInterestsList() async {
    addInterestLoading(true);
    List interestList = [];

    for (var interest in selectInterestList) {
      interestList.add(interest.id.toString());
    }

    debugPrint("$interestList");

    Map<String, dynamic> body = {"interest": interestList};
    var bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var request = http.Request('POST',
        Uri.parse(ApiConstants.baseUrl + ApiConstants.interestEndPoint));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
      await PrefsHelper.setBool(AppConstants.isLogged, true);
    } else {
      print(response.reasonPhrase);
    }
    addInterestLoading(false);
  }
}

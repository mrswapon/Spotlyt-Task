import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../../../../models/requester_home_screen_model.dart';

class RequesterHomeController extends GetxController {
  RequesterHomeScreenModel? homeScreenModel;

  RxBool isLoading = false.obs ;
  final ScrollController categoryScrollController = ScrollController();
  final ScrollController earlyAccessScrollController = ScrollController();

  //=====================> Page Scroll Method <=================================





requesterTaskService()async {


  isLoading.value = true;

  
  var response = await ApiClient.getData(ApiConstants.requesterTaskService) ;

  print(response) ;

  if(response.statusCode == 200) {
    homeScreenModel = RequesterHomeScreenModel.fromJson(response.body) ;
  } else {
    Get.snackbar(response.statusCode.toString(), response.statusText ?? "error") ;
  }

  isLoading.value = false ;


  
}


  //
  // Future<void> scrollControllerCall() async {
  //   if (categoryScrollController.position.pixels ==
  //       categoryScrollController.position.maxScrollExtent) {
  //     await
  //         //categoryAccessRepo
  //         ();
  //   }
  //   if (earlyAccessScrollController.position.pixels ==
  //       earlyAccessScrollController.position.maxScrollExtent) {
  //     await
  //         //categoryAccessRepo
  //         ();
  //   }
  // }
  //
  // //======================> Fatch Data Method <=================================
  // handleGetHomeData() async {
  //   String homeEndPoint = '/v1/tasks/service';
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NWZkNDAwMGQ2OGRmMTkzNjA3MDBlMjYiLCJpYXQiOjE3MTEyNzQ0MDEsImV4cCI6MTcxNDc4NTY3NTkyNCwidHlwZSI6ImFjY2VzcyJ9.-gS0qMPw1JjncwGi01YyvrVXsHozemn0wOEX7gvE1Ik'
  //   };
  //   try {
  //     var response = await ApiClient.getData(homeEndPoint, headers: headers);
  //     print("======> ${response.body}");
  //     if (response.statusCode == 200) {
  //       var allData = jsonDecode(response.body);
  //     }
  //   } catch (e, s) {
  //     print('====> $e');
  //     print('====> $s');
  //   }
  // }
  // Future<String> fetchData() async {
  //   final response = await http.get(
  //       Uri.parse('/v1/tasks/service'));
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body)['data'];
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
}

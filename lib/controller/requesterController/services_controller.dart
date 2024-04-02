import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../services/api_checker.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../../utils/app_icons.dart';
import 'requester_home_controller.dart';

class ServiceController extends GetxController {
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();
  final addLinkCtrl = TextEditingController();
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedServiceIndex = 0.obs;
  RxString interest = "".obs;
  var quantity = 1000.obs;
  RxInt totalPayable = 0.obs;

//==================================> Increment Counter Method <================================
  incrementQuantity() {
    quantity.value += 1000;
  }

//==================================> Decrement Counter Method <================================
  Future decrementQuantity() async {
    quantity.value -= 1000;
  }

  void setSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

//==================================> Submit Task Function <================================

  requesterSubmitTask() async {
    try {
      Map<String, dynamic> body = {
        "category": selectedCategoryIndex.value.toString(),
        "service": selectedServiceIndex.value.toString(),
        "addQuantity": quantity,
        "startDate": startDateCtrl.text,
        "endDate": endDateCtrl.text,
        "addLink": addLinkCtrl.text.trim(),
        "addInterest": interest,
        "totalPayable": totalPayable,
      };
      Response response = await ApiClient.postData(
          ApiConstants.requesterSubmitTaskEndPoint, jsonEncode(body));

      print("============> ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 201) {
        Fluttertoast.showToast(msg: response.body['message']);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> error : $e");
      print("===> error : $s");
    }
  }
}

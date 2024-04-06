import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/utils/app_constant.dart';
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
  RxDouble quantity = 1000.0.obs;
  double totalPayable = 0;

//==================================> Increment Counter Method <================================
  incrementQuantity() {
    quantity.value += 1000;
  }

//==================================> Decrement Counter Method <================================
  Future decrementQuantity() async {
    if (quantity > 1000) {
      quantity.value -= 1000;
    } else {
      print('Counter cannot be decremented further.');
    }
  }

  void setSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }
//==================================> Submit Task Method <================================

  requesterSubmitTask(String taskName, serviceId,price) async {

    try {
      var body = {
        "name": taskName,
        "taskLink": addLinkCtrl.text,
        "serviceId":"$serviceId",
        "quantity": "${quantity.value}",
        "price": "$price",
      };
      print('=============================> $body');
      Response response = await ApiClient.postData(
          ApiConstants.requesterSubmitTaskEndPoint,body);

      print("============> ${response.body} and ==> ${response.statusCode}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        Fluttertoast.showToast(msg: response.body['message']);
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e, s) {
      print("===> error : $e");
      print("===> error : $s");
    }
  }


  //===================> Picked Start Date TimeLine Function <==================
  Future<void> startDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3050),
    );
    if (pickedDate != null) {
      // setState(() {
        startDateCtrl.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
        // date = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      // });
      print('Selected date: ${startDateCtrl.text}');
    }
  }

  //======================> Picked End Date TimeLine Function <=================
  Future<void> endDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3050),
    );
    if (pickedDate != null) {
      // setState(() {
        endDateCtrl.text =
        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
        // date = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      // });
      print('Selected date: ${endDateCtrl.text}');
    }
  }
}

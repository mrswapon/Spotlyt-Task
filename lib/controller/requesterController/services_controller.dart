import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/models/interest_model.dart';
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
  final quantityCtrl = TextEditingController();
  RxInt selectedCategoryIndex = 0.obs;

  RxInt selectedServiceIndex = 0.obs;
  RxString interest = "".obs;
  RxDouble totalPayable = 0.0.obs;

  void calculateTotalPrice(double price) {
    int? quantity = int.tryParse(quantityCtrl.text);
    if (quantity != null) {
      totalPayable.value = quantity * price;
      debugPrint("Total Price :${totalPayable.value}");
    } else {
      // Handle invalid quantity input
      totalPayable.value = 0.0;
    }
  }

//==================================> Get Interested <================================

  RxList<Interest> interestList = <Interest>[].obs;
  late Interest selectInterest;

  var loading=false.obs;

  getInterest()async{
    loading(true);
    var response = await ApiClient.getData(ApiConstants.interestApi);
    if(response.statusCode==200){
      interestList.value=List<Interest>.from(response.body['data']['attributes'].map((item) => Interest.fromJson(item)));
      loading(false);
    }else{
      ApiChecker.checkApi(response);
    }


  }

  void setSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }
//==================================> Submit Task Method <================================

  requesterSubmitTask(String taskName, serviceId, price) async {
    var body = {
      "name": taskName,
      "taskLink": addLinkCtrl.text,
      "serviceId": "$serviceId",
      "quantity": quantityCtrl.text,
      "price": "$price",
    };
    print('=============================> $body');
    Response response = await ApiClient.postData(
        ApiConstants.requesterSubmitTaskEndPoint, body);
    print("============> ${response.body} and ==> ${response.statusCode}");
    if (response.statusCode == 201 || response.statusCode == 200) {
      Fluttertoast.showToast(msg: response.body['message']);
    } else {
      ApiChecker.checkApi(response);
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotlyt_task/models/interest_model.dart';
import 'package:spotlyt_task/services/payment_service.dart';
import '../../services/api_checker.dart';
import '../../services/api_client.dart';
import '../../services/api_constants.dart';
import '../../views/screens/payments/cancel_payment.dart';
import '../../views/screens/payments/payment_web_view.dart';
import '../../views/screens/payments/success_payment.dart';


class ServiceController extends GetxController {
  PaymentService paymentService= PaymentService();
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



  ///  payment Ozow
var paymentLoading=false.obs;

  makePayment(String taskName, serviceId, price,bool isCorporate)async{
    paymentLoading(true);
    var data = {
      "name": taskName,
      "taskLink": addLinkCtrl.text,
      "serviceId": "$serviceId",
      "quantity": quantityCtrl.text,
      "price": "$price",
    };
    var dataCo = {
      "name": taskName,
      "taskLink": addLinkCtrl.text,
      "serviceId": "$serviceId",
      "timeline":{             //optional value
        "start":startDateCtrl.text,    //optional value
        "end":endDateCtrl.text      //optional value
      },
      "quantity": quantityCtrl.text,
      "price": "$price",
    };
    submitTask(dataCo);
    // var response= await paymentService.makePaymentRequest(amount:50.03,);
    // if(response.runtimeType !=int){
    //   var responseData = jsonDecode(response);
    //   print(responseData);
    //   var successResponseUrl = responseData['url']; // Assuming the URL is in a 'url' field of the response
    //   if (successResponseUrl != null && successResponseUrl.isNotEmpty) {
    //     //  await launchUrl(Uri.parse(successResponseUrl),mode: LaunchMode.inAppWebView); // Opens successResponseUrl in the default browser
    //     Get.to(OzowPaymentUI(paymentLink:successResponseUrl,serviceInfo:isCorporate?dataCo:data,));
    //     print(successResponseUrl);
    //   } else {
    //     print('No valid URL found in the response.');
    //   }
    // }
    paymentLoading(false);



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


  submitTask(var serviceInfo) async {

    Response response = await ApiClient.postData(
        ApiConstants.requesterSubmitTaskEndPoint, json.encode(serviceInfo));
    print("============> ${response.body} and ==> ${response.statusCode}");
    if (response.statusCode == 201 || response.statusCode == 200) {
    } else {
      ApiChecker.checkApi(response);
    }
  }
}

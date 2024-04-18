import 'dart:convert';

import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../helpers/prefs_helper.dart';
import '../../models/interest_model.dart';
import '../../routes/app_routes.dart';
import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';

class AddInterestController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInterest();
    addInterestsList();
  }

  RxList<Interest> interestList = <Interest>[].obs;
  RxList<Interest> selectInterestList = <Interest>[].obs;



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



  RxBool addInterestLoading = false.obs;
  addInterestsList()async{
    addInterestLoading(true);

   // var interestTitle = [];
    var interestTitle = selectInterestList.map((interest) => interest.title).join(',');
   var  body = {
     "interest" : interestTitle
   };
    // for (var interest in selectInterestList) {
    //   interestTitle.add(interest.title);
    // }

   var response = await ApiClient.postData(ApiConstants.interestEndPoint, body);

    if(response.statusCode == 200){
      print("=============> Interest post done and interest list $interestTitle");
      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
      await PrefsHelper.setBool(AppConstants.isLogged, true);
    }
  }
}
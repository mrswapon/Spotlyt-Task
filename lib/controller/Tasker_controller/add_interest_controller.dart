import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../../helpers/prefs_helper.dart';
import '../../models/interest_model.dart';
import '../../services/api_checker.dart';
import '../../utils/app_constant.dart';

class AddInterestController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInterest();
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





}
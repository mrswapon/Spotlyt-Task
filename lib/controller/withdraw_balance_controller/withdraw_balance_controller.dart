
import 'package:get/get.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_constant.dart';

class WithDrawBalanceController extends GetxController{



  postWithDrawBalance(String bankName, String accountType,  accountNumber,  amount)async{
    String bearerToken = await PrefsHelper.getString(AppConstants.bearerToken);
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {
      "bankName": bankName,
      "accountNumber": accountType,
      "accountType": accountNumber,
      "withdrawalAmount": amount,
    };
    
    var reponse = await ApiClient.postData(ApiConstants.withdrawEidPoint, body, headers: headers);

    if(reponse.statusCode == 200 || reponse.statusCode == 201){
      Get.toNamed(AppRoutes.taskerProfileScreen);
    }
  }
}
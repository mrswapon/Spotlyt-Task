
import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_constants.dart';

import '../helpers/Bindings/prefs_helper.dart';





class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false})async{

    if(response.statusCode != 200){
      if(response.statusCode == 401) {
        // Get.put(AuthController()).clearSharedData();
        // await PrefsHelper.remove(ApiConstants.bearerToken);
        // Get.offAllNamed(AppRoute.signInScreen);
      }else {
        // showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }

    }


  }
}
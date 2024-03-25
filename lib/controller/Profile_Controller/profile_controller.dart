import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:spotlyt_task/helpers/Bindings/prefs_helper.dart';
import 'package:spotlyt_task/models/profile_models.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/utils/app_strings.dart';

import '../../services/api_constants.dart';

class ProfileController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  ProfileModel? profileModel;
 RxBool isProfileLoading = false.obs;
 getProfileData()async{
   isProfileLoading(true);
   try{
     String bearerToken = await PrefsHelper.getString(AppString.bearerToken);
     String id = await PrefsHelper.getString(AppString.id);
     var headers = {
       'Content-Type': 'application/json',
       'Authorization': 'Bearer $bearerToken'
     };
     var response = await ApiClient.getData(ApiConstants.profileEndPonint+id, headers: headers);
     print("=============response : ${response.body}");
     if(response.statusCode == 200){
       profileModel = ProfileModel.fromJson(response.body);
     }else{
       Get.snackbar(response.statusCode.toString(), response.statusText ?? "error") ;
     }

   }catch(e,s){
     print("=============== error e: $e");
     print("=============== error s: $s");
   }
   isProfileLoading(false);
 }
}
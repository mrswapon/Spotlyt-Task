import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_client.dart';
import 'package:spotlyt_task/services/api_constants.dart';

class AddInterestController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInterest();
  }

  RxList interestList = [].obs;


  getInterest()async{
    var reponse = await ApiClient.getData(ApiConstants.interestEndPoint);


    if(reponse.statusCode == 200){

    }
  }
}
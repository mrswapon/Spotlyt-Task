import 'package:get/get.dart';

class TaskerBottomController extends GetxController{

  var selectIndex = 0.obs;

  updateIndex(int index){
    selectIndex.value=index;
  }




}
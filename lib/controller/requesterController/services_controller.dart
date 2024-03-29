import 'package:get/get.dart';
import '../../utils/app_icons.dart';
import 'requester_home_controller.dart';

class ServiceController extends GetxController {

  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedServiceIndex = 0.obs;

  var quantity = 1000.obs;


//==================================> Increment Counter Method <================================
 incrementQuantity()  {
   quantity.value+=1000;
  }

//==================================> Decrement Counter Method <================================
  Future decrementQuantity() async {
      quantity.value-=1000;
  }
  void setSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}

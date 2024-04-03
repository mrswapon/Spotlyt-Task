import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spotlyt_task/controller/termsConditionsController/terms_conditions_controller.dart';

import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class TermsConditionScreen extends StatelessWidget {
  TermsConditionScreen({super.key});
  final TermsConditionsController _termsConditionsController =
      Get.put(TermsConditionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      //===========================================> AppBar Section <=============================================
      appBar: AppBar(
        title: CustomText(
          text: AppString.termsAndConditions,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge, vertical: 16.h),
          child: Column(
            children: [
              //===========================================> Text Section <=============================================
              Obx(
                () => CustomText(
                  textAlign: TextAlign.start,
                  text: _termsConditionsController.content.value,
                  fontsize: 14.h,
                  maxline: 1000,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

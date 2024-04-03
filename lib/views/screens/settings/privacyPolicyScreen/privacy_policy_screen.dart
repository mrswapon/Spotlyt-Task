import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spotlyt_task/controller/privacyPolicyController/privacy_policy_controller.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final PrivacyPolicyController _policyController =
      Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      //===========================================> AppBar Section <=============================================
      appBar: AppBar(
        title: CustomText(
          text: AppString.privacyPolicy,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge),
          child: Column(
            children: [
              //===========================================> Text Section <=============================================
              Obx(
                () => CustomText(
                  textAlign: TextAlign.start,
                  text: _policyController.content.value,
                  fontsize: 14.h,
                  maxline: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

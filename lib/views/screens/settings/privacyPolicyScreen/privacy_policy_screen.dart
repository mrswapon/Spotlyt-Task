import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spotlyt_task/controller/privacyPolicyController/privacy_policy_controller.dart';
import 'package:spotlyt_task/views/widgets/custom_circle_loader.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final PrivacyPolicyController _policyController =
      Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    _policyController.getPrivacy();
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
      body: Obx(
        () => _policyController.isLoading.value
            ? const CustomCircleLoader()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeLarge, vertical: 16.h),
                  child: Column(
                    children: [
                      //===========================================> Text Section <=============================================
                      Obx(
                        () => Html(
                          data: _policyController.content.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

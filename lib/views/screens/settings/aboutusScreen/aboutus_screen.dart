import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spotlyt_task/controller/aboutUsController/about_us_controller.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_circle_loader.dart';

import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class AboutusScreen extends StatelessWidget {
  AboutusScreen({super.key});
  final AboutUsController _aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    _aboutUsController.getAboutUs();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      //===========================================> AppBar Section <=============================================
      appBar: AppBar(
        title: CustomText(
          text: AppString.aboutUs,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _aboutUsController.isLoading.value
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
                          shrinkWrap: true,
                          data: _aboutUsController.content.value,
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

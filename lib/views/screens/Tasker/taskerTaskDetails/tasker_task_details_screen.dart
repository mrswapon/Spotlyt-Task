import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/time_count_section.dart';

class TaskerTaskDetailsScreen extends StatelessWidget {
  const TaskerTaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=========================> AppBar Section  <============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.taskDetails,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),

      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //=========================> Task Name <============================
            CustomText(
              text: AppString.taskName,
              fontWeight: FontWeight.w500,
              bottom: 16.h,
              top: 24.h,
            ),
            //=========================> Facebook Post Like Text  <============================
            CustomText(
              text: "Facebook Post Like ( 5000 )",
              fontWeight: FontWeight.w500,
              bottom: 24.h,
            ),
            //=========================> Task Link <==================================
            CustomText(
              text: AppString.taskLink,
              fontWeight: FontWeight.w500,
              bottom: 16.h,
            ),
            //=========================> Task Link Here <============================
            SelectableText(
              "https://www.Facebook.com/Image Post",
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0FD726)),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 24.h),
            //=========================> Task Post Text <============================
            CustomText(
              text: AppString.taskPost,
              fontWeight: FontWeight.w500,
              bottom: 16.h,
            ),
            //=========================> Date Text <=================================
            CustomText(
              text: "Friday 01 Feb, 2024",
              fontWeight: FontWeight.w500,
              bottom: 24.h,
            ),
            //SizedBox(height: 24.h),
            //=========================> Time Line Text <============================
            CustomText(
              text: AppString.timeLine,
              fontWeight: FontWeight.w500,
              bottom: 24.h,
            ),
            //=================================> Time Count Section <================================
            const TimeCountSection(),
            const Spacer(),

            //==============================> Task Register Now Button <===================================
            CustomButton(
                title: AppString.taskRegisterNow,
                onpress: () {
                  Get.toNamed(AppRoutes.registerScreen);
                }),
            SizedBox(height: 54.h)
          ],
        ),
      ),
    );
  }
}

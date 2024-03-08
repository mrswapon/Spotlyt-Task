import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class SelectroleScreen extends StatelessWidget {
  const SelectroleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //=============================> Text Section <=============================
              CustomText(
                text: AppStrings.areYouLooking,
                fontName: 'Lato/R 16',
                bottom: 4.h,
              ),
              CustomText(
                text: AppStrings.orToEarn,
                fontName: 'Lato/R 16',
                bottom: 4.h,
              ),
              //=============================> Button Section <=============================
              SizedBox(height: 24.h),
              CustomButton(title: AppStrings.requester, onpress: () {}),
              SizedBox(height: 16.h),
              CustomButton(
                  title: AppStrings.tasker,
                  titlecolor: AppColors.primaryColor,
                  color: Colors.white,
                  onpress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

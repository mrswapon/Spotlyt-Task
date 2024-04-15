import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class FailedPayment extends StatelessWidget {
  const FailedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //=====================> Lottie Failed Animation <=======================
            Lottie.asset(
              'assets/animation/failed_animation.json',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 46.h),
            //=====================> Purchase Failed Text <=======================
            CustomText(
              text: "Purchase Failed!",
              fontsize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
            SizedBox(height: 36.h),
            CustomText(
              text:
                  "Bank balance issue, please check!\n your bank balance in order to \ncontinue.",
              fontsize: 16.sp,
              color: AppColors.black333333,
            ),
            //=====================> Try Again Button <=======================
            SizedBox(height: 60.h),
            CustomButton(
              onpress: () {



              },
              title: 'Try Again',
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

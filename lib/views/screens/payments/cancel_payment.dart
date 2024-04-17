import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class CancelPayment extends StatelessWidget {
  const CancelPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //=====================> Lottie Cancel Animation <=======================
            Lottie.asset(
              'assets/animation/cancel_animation.json',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 46.h),
            //=====================> Purchase Cancel Text <=======================
            CustomText(
              text: "Purchase Canceled!",
              fontsize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
            SizedBox(height: 36.h),
            CustomText(
              text:
                  "Oops! Your payment has been canceled.\n  Please check your details \nand try again.",
              fontsize: 16.sp,
              color: AppColors.black333333,
            ),
            //=====================> Go Back Button <=======================
            SizedBox(height: 60.h),
            CustomButton(
              onpress: () {
               Get.back();
              },
              title: 'Go Back',
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

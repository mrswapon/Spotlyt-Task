import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/pin_code_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.verifyOTP,
          fontName: 'Lato/M 18',
          fontsize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      //===============================> Body Section <===============================
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //=================================> PasswordOutline Image Section <===============================
              SizedBox(height: 123.h),
              Center(
                  child: Image.asset(AppImages.passwordOutline,
                      width: 94.5.w, height: 120.h)),
              SizedBox(height: 24.h),
              CustomText(
                textAlign: TextAlign.start,
                maxline: 5,
                text: AppString.weHaveSent,
                fontName: 'Lato',
                fontsize: 16.sp,
              ),
              //=================================> PinCodeField Section <===============================
              SizedBox(height: 24.h),
              const PinCodeField(),
              //=================================> Didn’t recieve the code? Section <===============================
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppString.didntRecieve,
                    fontName: 'Lato',
                    fontsize: 16.sp,
                    color: const Color(0xff5C5C5C),
                  ),
                  CustomText(
                    text: AppString.resend,
                    fontName: 'Lato',
                    fontsize: 16.sp,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              //=================================>  Section <===============================
              SizedBox(height: 39.h),
              CustomButton(title: AppString.verify, onpress: () {
                Get.offAllNamed(AppRoutes.signInScreen);
              })
            ],
          ),
        ),
      ),
    );
  }
}

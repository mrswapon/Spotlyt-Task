import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/forgot_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.forgotpassword,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //=================================> PasswordOutline Image Section <===============================
              SizedBox(height: 123.h),
              Center(
                  child: Image.asset(AppImages.mailOutline,
                      width: 94.5.w, height: 120.h)),
              SizedBox(height: 24.h),
              CustomText(
                textAlign: TextAlign.start,
                maxline: 5,
                text: AppString.enterEmail,
                fontName: 'Lato',
                fontsize: 16.sp,
              ),
              //=================================> PinCodeField Section <===============================
              SizedBox(height: 24.h),
              ForgotForm(),

            ],
          ),
        ),
      ),
    );
  }
}

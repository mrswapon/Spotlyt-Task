import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/reset_form.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});

  var parameter = Get.parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.resetpassword,
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
              //=================================> SetPasswordOutline Image Section <===============================
              SizedBox(height: 134.h),
              Center(
                  child: Image.asset(AppImages.setPasswordOutline,
                      width: 94.5.w, height: 120.h)),
              //=================================> PinCodeField Section <===============================
              SizedBox(height: 20.h),
              ResetForm(email: "${parameter['email']}",),
            ],
          ),
        ),
      ),
    );
  }
}

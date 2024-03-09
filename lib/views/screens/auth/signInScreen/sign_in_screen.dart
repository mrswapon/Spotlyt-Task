import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/text_form_section.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.signin,
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
              SizedBox(height: 88.h),
              Center(
                  child: Image.asset(AppImages.appLogo,
                      width: 171.w, height: 49.h)),
              //=================================> Textfield Section <===============================
              TextFormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

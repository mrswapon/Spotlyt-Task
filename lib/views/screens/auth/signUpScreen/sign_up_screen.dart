import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/views/screens/auth/signUpScreen/InnerWidget/textfield_section.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //===============================> AppBar Section <===============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.signUp,
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
              SizedBox(height: 80.h),
              Center(
                  child: Image.asset(AppImages.appLogo,
                      width: 171.w, height: 49.h)),
              //=================================> Textfield Section <===============================
              TextfieldSection(),
            ],
          ),
        ),
      ),
    );
  }
}

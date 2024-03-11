import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';
import '../../../../widgets/custom_text_field.dart';

class TextFormSection extends StatefulWidget {
  const TextFormSection({super.key});

  @override
  State<TextFormSection> createState() => _TextFormSectionState();
}

class _TextFormSectionState extends State<TextFormSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isObscures = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 64.h),
              //===============================> Email Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                controller: _emailController,
                prefixIcon: _customIcons(AppIcons.mail),
                hintText: AppString.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              //===============================> Password Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                isObscureText: isObscures,
                controller: _passController,
                prefixIcon: _customIcons(AppIcons.lockClosed),
                sufixicons: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscures = !isObscures;
                      });
                    },
                    child: SvgPicture.asset(
                      isObscures ? AppIcons.eyeOff : AppIcons.eye,
                      color: AppColors.primaryColor,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                ),
                hintText: AppString.password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.forgotPasswordScreen);
                },
                child: CustomText(
                  text: AppString.forgotPassword,
                  fontWeight: FontWeight.w600,
                  fontsize: 16.h,
                  fontName: 'Lato',
                  color: AppColors.primaryColor,
                ),
              ),

              //===============================> Sign In Button <===============================
              SizedBox(height: 24.h),
              CustomButton(
                  title: AppString.signIn,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      Get.offAllNamed(AppRoutes.addInterestScreen);
                    }
                  }),
              SizedBox(height: 235.h),
              //===============================> Don’t have an account Section <===============================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppString.dontHaveAccount,
                    fontWeight: FontWeight.w500,
                    fontsize: 15.h,
                    fontName: 'Lato',
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.signUpScreen);
                    },
                    child: CustomText(
                      color: AppColors.primaryColor,
                      text: AppString.signUps,
                      fontWeight: FontWeight.w500,
                      fontsize: 15.h,
                      fontName: 'Lato',
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        )
      ],
    );
  }
  //===============================> Custom Icons Method <===============================
  _customIcons(
    String icon,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: SvgPicture.asset(
        icon,
        color: AppColors.primaryColor,
        height: 24.h,
        width: 24.w,
      ),
    );
  }
}

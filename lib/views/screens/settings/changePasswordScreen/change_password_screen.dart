import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Auth_Controller/auth_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _oldPassController = TextEditingController();
  // final TextEditingController _newPassController = TextEditingController();
  // final TextEditingController _confirmPassController = TextEditingController();
  AuthController _authController = Get.put(AuthController());
  bool isObscuresOld = true;
  bool isObscure = true;
  bool isObscures = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: CustomText(
          text: AppString.changePassword,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //===============================> Old Password Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 14.h,
                      isObscureText: isObscuresOld,
                      controller: _authController.oldPasswordCtrl,
                      prefixIcon: _customIcons(AppIcons.lockClosed),
                      sufixicons: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscuresOld = !isObscuresOld;
                            });
                          },
                          child: SvgPicture.asset(
                            isObscuresOld ? AppIcons.eyeOff : AppIcons.eye,
                            color: AppColors.primaryColor,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                      hintText: AppString.oldPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter old password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    //===============================> Set New Password Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 14.h,
                      isObscureText: isObscures,
                      controller: _authController.newPasswordCtrl,
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
                      hintText: AppString.setNewPassword,
                      validator: (value) {
                        if (value == null) {
                          return "Please set new password";
                        }else if(value.length < 8){
                          return "Password must be at least 8 characters";
                        }else if(_validatePassword(value)){
                          return "password must contain at least 1 letter and 1 number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    //===============================> Confirm Password Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 14.h,
                      isObscureText: isObscure,
                      controller: _authController.confirmPassController,
                      prefixIcon: _customIcons(AppIcons.lockClosed),
                      sufixicons: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 21.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child: SvgPicture.asset(
                            isObscure ? AppIcons.eyeOff : AppIcons.eye,
                            color: AppColors.primaryColor,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ),
                      hintText: AppString.confirmPassword,
                      validator: (value) {
                        if (value == null) {
                          return "Please re-enter new password";
                        }else if(value == _authController.newPasswordCtrl){
                          return "Passwords do not match";
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
                    SizedBox(height: 367.h),
                    //===============================> Change Password Button <===============================
                    CustomButton(
                        title: AppString.changePassword,
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            _authController.handleChangePassword(_authController.oldPasswordCtrl.text, _authController.newPasswordCtrl.text);
                            // Get.toNamed(AppRoutes.verifyOtpScreen);
                          }
                        }),
                    SizedBox(height: 74.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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


  bool _validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(value);
  }
}

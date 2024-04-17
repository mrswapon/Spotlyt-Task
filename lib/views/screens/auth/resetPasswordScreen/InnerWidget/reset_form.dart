import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Auth_Controller/auth_controller.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

class ResetForm extends StatefulWidget {
   ResetForm({super.key, required this.email});
  String email;

  @override
  State<ResetForm> createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  AuthController _authController = Get.put(AuthController());
  bool isObscure = true;
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
              //===============================> Set New Password Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                isObscureText: isObscures,
                controller: _newPassController,
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
                  if (value == null || value.isEmpty) {
                    return "Please set new password";
                  }else if(value.length < 8 || !_validatePassword(value)){
                    return "Password: 8 characters min, letters & digits required";
                  }
                  return null;
                },
              ),
              //===============================> Confirm Password Text-field <===============================
              SizedBox(height: 16.h),
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                contenpaddingVertical: 14.h,
                isObscureText: isObscure,
                controller: _confirmPassController,
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
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }else if(value != _newPassController.text){
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              //===============================> Reset Password Button <===============================
              SizedBox(height: 44.h),
              CustomButton(
                  title: AppString.resetPassword,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.resetPassword(widget.email, _newPassController.text);
                      // Get.toNamed(AppRoutes.verifyOtpScreen);
                    }
                  }),
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


  bool _validatePassword(String value) {
    // RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    RegExp regex = RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$');
    // RegExp regex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return regex.hasMatch(value);
  }
}

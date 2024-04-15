import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Auth_Controller/auth_controller.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

class ForgotForm extends StatefulWidget {
  const ForgotForm({super.key});

  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //===============================> Email Text-field <===============================
              CustomTextField(
                contenpaddingHorizontal: 16.w,
                controller: _authcontroller.forgetEmailTextCtrl,
                contenpaddingVertical: 14.h,
                prefixIcon: _customIcons(AppIcons.mail),
                hintText: AppString.email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              //===============================> Sign Up Button <===============================
              SizedBox(height: 44.h),
              Obx(()=>
                  CustomButton(
                      loading: _authcontroller.forgotLoading.value,
                      title: AppString.getOTP,
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          _authcontroller.handleForget();
                          // Get.toNamed(AppRoutes.verifyOtpScreen);
                        }
                      })
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: CustomText(
          text: AppString.verify,
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
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        //===============================> Full Name Text-field <===============================
                        CustomTextField(
                          contenpaddingHorizontal: 16.w,
                          contenpaddingVertical: 14.h,
                          controller: _fullNameController,
                          prefixIcon: _customIcons(AppIcons.person),
                          hintText: AppString.fullName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        //===============================> Email Text-field <===============================
                        CustomTextField(
                          contenpaddingHorizontal: 16.w,
                          contenpaddingVertical: 14.h,
                          controller: _emailController,
                          prefixIcon: _customIcons(AppIcons.mail),
                          hintText: AppString.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your user email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        //===============================> Phone Number Text-field <===============================
                        CustomTextField(
                          contenpaddingHorizontal: 16.w,
                          contenpaddingVertical: 14.h,
                          controller: _phoneController,
                          prefixIcon: _customIcons(AppIcons.phone),
                          hintText: AppString.phoneNumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                        ),
                        //===============================> Address Text-field <===============================
                        SizedBox(height: 16.h),
                        CustomTextField(
                          contenpaddingHorizontal: 16.w,
                          contenpaddingVertical: 14.h,
                          controller: _addressController,
                          prefixIcon: _customIcons(AppIcons.location),
                          hintText: AppString.address,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your address";
                            }
                            return null;
                          },
                        ),
                        //===============================> Nid Number Text-field <===============================
                        SizedBox(height: 16.h),
                        CustomTextField(
                          contenpaddingHorizontal: 16.w,
                          contenpaddingVertical: 14.h,
                          controller: _nidController,
                          prefixIcon: _customIcons(AppIcons.creditCard),
                          hintText: AppString.nid,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your nid";
                            }
                            return null;
                          },
                        ),
                        //===============================> Verify Button <===============================
                        SizedBox(height: 254.h),
                        CustomButton(
                            title: AppString.verify,
                            onpress: () {
                              if (_formKey.currentState!.validate()) {
                                Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                              }
                            }),
                        SizedBox(height: 54.h),
                      ],
                    ),
                  ),
                ],
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
}

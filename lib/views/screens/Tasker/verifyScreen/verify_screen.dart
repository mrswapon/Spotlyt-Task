import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/models/profile_models.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProfileController _profileController = Get.put(ProfileController());

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    initProfileData();
    super.initState();
  }

  initProfileData() {
    var data = _profileController.profileModel.value;
    _fullNameController.text = data.fullName ?? '';
    _emailController.text = data.email!;
    _phoneController.text =
        data.phoneNumber != null ? data.phoneNumber.toString() : "";
    _addressController.text = data.address ?? "";
  }

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
      body: Obx(() {
        _profileController.profileModel.value;
        return SingleChildScrollView(
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

                          _profileController.profileModel.value.phoneNumber == null || _profileController.profileModel.value.address == null
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    SizedBox(height: 16.h),
                                    //===============================> Phone Number Text-field <===============================
                                    CustomTextField(
                                      keyboardType: TextInputType.number,
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
                                      prefixIcon:
                                          _customIcons(AppIcons.location),
                                      hintText: AppString.address,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your address";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),

                          //===============================> Nid Number Text-field <===============================
                          SizedBox(height: 16.h),
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            contenpaddingHorizontal: 16.w,
                            contenpaddingVertical: 14.h,
                            controller: _profileController.nidCtrl,
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
                                  _profileController.handleNidVerify();
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
        );
      }),
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

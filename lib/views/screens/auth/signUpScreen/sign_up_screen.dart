import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Auth_Controller/auth_controller.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/auth/signUpScreen/InnerWidget/textfield_section.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 78.h),
              Center(
                  child: Image.asset(AppImages.appLogo,
                      width: 171.w, height: 49.h)),
              SizedBox(height: 42.h),
              //===============================> Role Selected Section <===============================

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //===============================> Tasker Button <===============================
                  Expanded(
                    flex: 1,
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            // authController.role.value = "client";
                            authController.selectRole("employee");
                            authController.isSelectedRole(true);
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                                color: authController.isSelectedRole.value
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    width: 1.w, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.5.w, vertical: 6.5.h),
                              child: CustomText(
                                text: AppString.tasker,
                                fontsize: 14.h,
                                color: authController.isSelectedRole.value
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ),
                  //===============================> Client Button <===============================
                  Expanded(
                    flex: 1,
                    child: Obx(() => GestureDetector(
                      onTap: () {
                        // authController.role.value = "employee";
                        authController.selectRole("client");
                        authController.isSelectedRole(false);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 8.w),
                        decoration: BoxDecoration(
                            color: authController.isSelectedRole.value
                                ? Colors.white
                                : AppColors.primaryColor,
                            border: Border.all(
                                width: 1.w, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.5.w, vertical: 6.5.h),
                          child: CustomText(
                            text: AppString.client,
                            fontsize: 14.h,
                            color: authController.isSelectedRole.value
                                ? AppColors.primaryColor
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              ),

              //=================================> Text field Section <===============================
              TextfieldSection(),
            ],
          ),
        ),
      ),
    );
  }
}

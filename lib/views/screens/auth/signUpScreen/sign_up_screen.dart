import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/auth/signUpScreen/InnerWidget/textfield_section.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RxBool isSelected = true.obs;
  void toggleSelected() {
    isSelected.value = !isSelected.value;
  }

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
                  //===============================> Requester Button <===============================
                  Expanded(
                    flex: 1,
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            toggleSelected();
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                                color: isSelected.value
                                    ? AppColors.primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    width: 1.w, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.5.w, vertical: 6.5.h),
                              child: CustomText(
                                text: AppString.requester,
                                fontsize: 14.h,
                                color: isSelected.value
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )),
                  ),
                  //===============================> Tasker Button <===============================
                  Expanded(
                    flex: 1,
                    child: Obx(() => GestureDetector(
                          onTap: () {
                            toggleSelected();
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                                color: isSelected.value
                                    ? Colors.white
                                    : AppColors.primaryColor,
                                border: Border.all(
                                    width: 1.w, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.5.w, vertical: 6.5.h),
                              child: CustomText(
                                text: AppString.tasker,
                                fontsize: 14.h,
                                color: isSelected.value
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

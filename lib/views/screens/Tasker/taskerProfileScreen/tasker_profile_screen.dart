import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import 'InnerWidgets/top_profile_card.dart';

class TaskerProfileScreen extends StatelessWidget {
  TaskerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///------------------------------top profile card------------------------------------>
            TopProfileCard(),
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                children: [
                  ///--------------------------personal information---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.personalInformationScreen);
                      },
                      title: CustomText(
                        text: AppString.personalInformation,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.profile,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
        
                  ///--------------------------setting ---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingsScreen);
                      },
                      title: CustomText(
                        text: AppString.settings,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.setting,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
        
                  ///--------------------------Invite & Earn---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.inviteEarnScreen);
                      },
                      title: CustomText(
                        text: AppString.inviteAndEarn,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.share,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
        
                  ///--------------------------log out---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        //=========================================> Alert Dialog <======================================
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  backgroundColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 26.h),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomText(
                                        text: AppString.youAreSure,
                                        fontsize: 16.sp,
                                        maxline: 3,
                                        color: Colors.black,
                                        fontName: 'Lato',
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(height: 24.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 120.w,
                                              child: Center(
                                                child: CustomButton(
                                                  title: 'Log Out',
                                                  fontSize: 16.h,
                                                  onpress: () {
                                                    Get.offAllNamed(
                                                        AppRoutes.signInScreen);
                                                  },
                                                  color: Colors.white,
                                                  titlecolor:
                                                      AppColors.primaryColor,
                                                ),
                                              )),
                                          SizedBox(
                                              width: 120.w,
                                              child: Center(
                                                child: CustomButton(
                                                    title: 'Cancel',
                                                    fontSize: 16.h,
                                                    color: AppColors.primaryColor,
                                                    onpress: () {
                                                      Get.back();
                                                    }),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  elevation: 12.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      side: BorderSide(
                                          width: 1.w,
                                          color: AppColors.primaryColor)));
                            });
                      },
            //==========================================================================================================
                      title: CustomText(
                        text: AppString.logOut,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.logout,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

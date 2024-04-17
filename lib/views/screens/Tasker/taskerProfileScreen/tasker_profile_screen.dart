import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../ProfileScreen/InnerWidgets/aleart_dialog.dart';
import '../../ProfileScreen/InnerWidgets/top_profile_card.dart';

class TaskerProfileScreen extends StatelessWidget {
  TaskerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///------------------------------top profile card------------------------------------>
            const TopProfileCard(),

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

                  ///--------------------------Get Verified ---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.verifyScreen);
                      },
                      title: CustomText(
                        text: AppString.getVerfied,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.veryfy,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16.h,
                  ),

                  ///--------------------------Wallet ---------------------------->
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.taskerWalletScreen);
                      },
                      title: CustomText(
                        text: AppString.wallet,
                        textAlign: TextAlign.start,
                      ),
                      leading: SvgPicture.asset(
                        AppIcons.wallet,
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () {
                        //=========================================> Alert Dialog <======================================
                        _logoutDialog(context);
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

                  SizedBox(
                    height: 60.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const LogoutDialog();
        });
  }
}

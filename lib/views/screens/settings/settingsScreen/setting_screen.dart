import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_list_lile.dart';
import '../../../widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: CustomText(
          text: AppString.settings,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            //=================================> Change Password Section <=======================
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.changePasswordScreen);
              },
              child: CustomListTile(
                title: AppString.changePassword,
                prefixIcon: SvgPicture.asset(
                  AppIcons.lockClosed,
                  color: Colors.black,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            //=================================> Privacy Policy Section <=======================

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen);
              },
              child: CustomListTile(
                title: AppString.privacyPolicy,
                prefixIcon: SvgPicture.asset(
                  AppIcons.privacy,
                  color: Colors.black,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            //=================================> Terms & Conditions Section <=======================

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.termsConditionScreen);
              },
              child: CustomListTile(
                title: AppString.termsAndConditions,
                prefixIcon: SvgPicture.asset(
                  AppIcons.trems,
                  color: Colors.black,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            //=================================> About Us Section <=======================
            GestureDetector(
              onTap: () {
                //Get.toNamed(AppRoutes.aboutusScreen);
              },
              child: CustomListTile(
                title: AppString.aboutUs,
                prefixIcon: SvgPicture.asset(
                  AppIcons.about,
                  color: Colors.black,
                ),
                sufixIcon: SvgPicture.asset(
                  AppIcons.rightArrow,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
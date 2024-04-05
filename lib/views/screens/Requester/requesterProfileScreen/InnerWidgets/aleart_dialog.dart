
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../helpers/prefs_helper.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_constant.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text.dart';

class AleartDialog extends StatelessWidget {
  const AleartDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 120.w,
                    child: Center(
                      child: CustomButton(
                        title: 'Log Out',
                        fontSize: 16.h,
                        onpress: () async {
                          await PrefsHelper.remove(AppConstants.isLogged);
                          await PrefsHelper.remove(AppConstants.role);
                          await PrefsHelper.remove(AppConstants.isLogged);
                          await PrefsHelper.remove(AppConstants.bearerToken);
                          Get.offAllNamed(AppRoutes.signInScreen);
                        },
                        color: Colors.white,
                        titlecolor: AppColors.primaryColor,
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
            side: BorderSide(width: 1.w, color: AppColors.primaryColor)));
  }
}
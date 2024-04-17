import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../helpers/prefs_helper.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_constant.dart';
import '../../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
        title: Text(
          "Confirm Logout!",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        content: CustomText(
          text: AppString.youAreSure,
          fontsize: 16.sp,
          maxline: 3,
          color: Colors.black,
          fontName: 'Lato',
          fontWeight: FontWeight.w500,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "No",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              )),
          TextButton(
              onPressed: () async {
                await PrefsHelper.remove(AppConstants.role);
                await PrefsHelper.remove(AppConstants.isLogged);
                await PrefsHelper.remove(AppConstants.bearerToken);
                Get.offAllNamed(AppRoutes.signInScreen);
              },
              child: Text(
                "Yes",
                style:
                    TextStyle(fontSize: 14.sp, color: AppColors.primaryColor),
              )),
          // OutlinedButton(
          //     style: OutlinedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8.r),
          //       ),
          //       side: const BorderSide(
          //         color: AppColors.primaryColor,
          //         width: 1,
          //       ),
          //       padding: EdgeInsets.zero,
          //       minimumSize: Size(120.w, 41.h),
          //     ),
          //     onPressed: () {},
          //     child: Text(
          //       "Logout",
          //       style: TextStyle(
          //           fontSize: 14.sp, color: AppColors.primaryColor),
          //     )),
          // SizedBox(width: 20.w,),
          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         padding: EdgeInsets.zero,
          //         minimumSize: Size(120.w, 41.h),
          //         textStyle:
          //         TextStyle(fontSize: 14.sp, color: Colors.white)),
          //     child: const Text(
          //       "Cancel",
          //     ),
          //     onPressed: () {
          //       //Get.back();
          //     }),
        ],
        elevation: 12.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(width: 1.w, color: AppColors.primaryColor)));
  }
}

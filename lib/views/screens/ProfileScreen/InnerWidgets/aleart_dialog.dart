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
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        content: CustomText(
          text: AppString.youAreSure,
          fontsize: 18.sp,
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
                style: TextStyle(fontSize: 20.sp, color: Colors.grey),
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
                    TextStyle(fontSize: 20.sp, color: AppColors.primaryColor),
              )),
        ],
        elevation: 12.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(width: 1.w, color: AppColors.primaryColor)));
  }
}

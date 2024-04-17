import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class TopProfileCard extends StatelessWidget {
  final String? profileName;
  final String? profileUrl;
  final double? height;
  final String? badge;

  const TopProfileCard(
      {super.key, this.profileName, this.profileUrl, this.height, this.badge});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 337.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffA0C5A0),
          border: const Border(
              bottom: BorderSide(color: AppColors.primaryColor, width: 1.80)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24.r),
            bottomRight: Radius.circular(24.r),
          )),
      child: Column(
        children: [
          CustomText(
            text: AppString.profile,
            fontsize: 18.h,
            fontWeight: FontWeight.w500,
            bottom: 44.h,
            top: 65.h,
          ),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryColor)),

            ///------------------image------------------>
            child: profileUrl == null
                ? const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.no_internet_profile),
                  )
                : CircleAvatar(
                    backgroundImage:
                        NetworkImage("${ApiConstants.imageBaseUrl}$profileUrl"),
                  ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "$profileName" ?? "",
                  fontsize: 18.h,
                  fontWeight: FontWeight.w500,
                  // top: 5.h,
                ),

                SizedBox(
                  width: 4.w,
                ),
                if (badge == "cancelled")
                  const SizedBox()
                else if (badge == "pending")
                  const SizedBox()
                else if (badge == "unverified")
                  const SizedBox()
                else if (badge == "approved")
                  SvgPicture.asset(
                    AppIcons.badgeCheck,
                    color: AppColors.primaryColor,
                    height: 25.h,
                  ),
                // badge == null ? const SizedBox() :
                // SvgPicture.asset(AppIcons.badgeCheck, color: AppColors.primaryColor, height: 25.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';

class TopProfileCard extends StatelessWidget {
  final String? profileName;
  final String? profileUrl;
  final double? height;

  const TopProfileCard({super.key, this.profileName, this.profileUrl, this. height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 337.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffA0C5A0),
          border:
              const Border(bottom: BorderSide(color: AppColors.primaryColor,width: 1.80)),
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
            child: profileUrl == null?
            const CircleAvatar(
              backgroundImage: AssetImage(AppImages.no_internet_profile),
            )

            :CircleAvatar(
              backgroundImage: NetworkImage("${ApiConstants.baseUrl}/$profileUrl"),
            ),
          ),
          Expanded(
            child: CustomText(
              text: "$profileName" ?? "",
              fontsize: 18.h,
              fontWeight: FontWeight.w500,
              top: 5.h,
            ),
          ),
        ],
      ),
    );
  }
}

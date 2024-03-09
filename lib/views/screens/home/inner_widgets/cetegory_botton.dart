import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_text.dart';

class CetegoryBotton extends StatelessWidget {
  final String? icon;
  final String? name;
  const CetegoryBotton({super.key, this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),

            ///-------------------------botton icon--------------------------->
            child: SvgPicture.asset(
              "$icon",
              color: Colors.white,
              width: 14.w,
              height: 14.h,
              fit: BoxFit.cover,
            ),
          ),

          ///----------------------------botton name----------------------------->
          CustomText(
            text: "$name",
            color: Colors.white,
            fontsize: 12.h,
            fontWeight: FontWeight.w500,
            right: 14.w,
            left: 4.w,
          )
        ],
      ),
    );
  }
}

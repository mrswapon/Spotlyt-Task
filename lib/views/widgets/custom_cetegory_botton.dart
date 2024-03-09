

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomCetegoryBotton extends StatelessWidget {
  final bool isSelected;
  final String? icon;
  final String? name;
  final VoidCallback? onTap;

  const CustomCetegoryBotton(
      {Key? key, required this.isSelected, this.icon, this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),

            ///-------------------------botton icon--------------------------->
            child: SvgPicture.asset(
              "$icon",
              color: isSelected ? Colors.white : AppColors.primaryColor,
              width: 14.w,
              height: 14.h,
              fit: BoxFit.cover,
            ),
          ),

          ///----------------------------botton name----------------------------->
          CustomText(
            text: "$name",
            color: isSelected ? Colors.white : AppColors.primaryColor,
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

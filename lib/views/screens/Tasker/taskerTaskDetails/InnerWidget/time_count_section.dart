import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';

class TimeCountSection extends StatelessWidget {
  const TimeCountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: Colors.grey),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //=======================================> Start Date Section <=========================================
            Row(
              children: [
                SvgPicture.asset(AppIcons.timeIcon),
                SizedBox(width: 6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppString.startDate,
                      fontWeight: FontWeight.w500,
                      fontsize: 12.h,
                      fontName: 'Lato',
                      color: const Color(0xff5C5C5C),
                      bottom: 6.h,
                    ),
                    CustomText(
                      text: 'Mar 01, 2024',
                      fontWeight: FontWeight.w600,
                      fontName: 'Lato',
                      color: Color(0xff333333),
                      bottom: 6.h,
                    ),
                  ],
                )
              ],
            ),
            //=======================================> End Date Section <=========================================
            Row(
              children: [
                SvgPicture.asset(AppIcons.timeIcon),
                SizedBox(width: 6.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppString.endDate,
                      fontWeight: FontWeight.w500,
                      fontsize: 12.h,
                      fontName: 'Lato',
                      color: const Color(0xff5C5C5C),
                      bottom: 6.h,
                    ),
                    CustomText(
                      text: 'Mar 05, 2024',
                      fontWeight: FontWeight.w600,
                      fontName: 'Lato',
                      color: Color(0xff333333),
                      bottom: 6.h,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

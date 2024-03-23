import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String title;
  final Color? color;
  final Color? titlecolor;
  final double? height;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.title,
    required this.onpress,
    this.color,
    this.height,
    this.fontSize,
    this.titlecolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: 353.w,
        height: height ?? 52.h,
        padding: EdgeInsets.all(10.h),
        decoration: color == null
            ? ShapeDecoration(
                color:  const Color(0xFF318130),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              )
            : ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(8.r)),
              ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              fontsize: fontSize ?? 18.h,
              color: titlecolor ?? Colors.white,
              fontName: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

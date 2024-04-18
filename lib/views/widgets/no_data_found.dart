import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../utils/app_icons.dart';

class CustomNoDataFound extends StatelessWidget {
  final String? title;

  const CustomNoDataFound({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45.r),
      child: Stack(
        children: [
          SvgPicture.asset(AppIcons.notDataFound),
          Positioned(
            left: 105.w,
            right: 50.w,
            top: 90.h,
            bottom: 50.h,
            child: Center(
              child: CustomText(
                text: title ?? "No task",
                // color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class CustomListTileWidget extends StatelessWidget {
  final String? title;
  final String? icon;
  final VoidCallback? ontap;

  const CustomListTileWidget({super.key, this.title, this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.primaryColor)),
          child: ListTile(
            onTap: ontap,
            title: CustomText(
              text: "$title",
              textAlign: TextAlign.start,
            ),
            leading: SvgPicture.asset(
              "$icon",
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

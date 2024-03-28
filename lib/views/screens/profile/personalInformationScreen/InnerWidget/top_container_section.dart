import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TopContainerSection extends StatelessWidget {
 final String? name;
 final String? image;
 final VoidCallback? ontap;



   TopContainerSection({
    this.name,
    this.image,
     this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFA0C5A0),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///---------------------------profile image------------------>
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 70.w,
                  height: 70.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.network(
                    "${ApiConstants.baseUrl}/${image}"??"",
                    fit: BoxFit.cover,
                  ),
                ),

                ///-------------------------profile name----------------------->
                CustomText(
                  text: '$name'??"",
                  fontsize: 24.sp,
                ),
                IconButton(
                    onPressed: ontap,
                    icon: SvgPicture.asset(
                      AppIcons.edit,
                      color: AppColors.primaryColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

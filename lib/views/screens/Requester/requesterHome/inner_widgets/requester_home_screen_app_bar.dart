import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class HomeScreenAppBar extends StatelessWidget {
  HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///---------------------profile image------------------------>
        CircleAvatar(
          radius: 20.r,
          backgroundImage: const AssetImage(AppImages.profileImg),
        ),
        SizedBox(
          width: 12.w,
        ),

        ///---------------------------hello (profile name)----------------------->
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Hello",
                color: AppColors.black5C5C5C,
              ),
              CustomText(
                text: "Sagor Ahamed ",
                fontsize: 20.h,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
        SizedBox(
          width: 10.w,
        ),




        GestureDetector(
          onTap: () {
             Get.toNamed(AppRoutes.notificationScreen);
          },
          child:Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                shape: BoxShape.circle
            ),
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppIcons.bellIcon,
                  height: 32.h,
                  width: 32.w,
                ),
                 Positioned(
                  top: 3.h,
                  right: 3.w,
                  child: Badge(
                    backgroundColor: Colors.red,
                    smallSize: 11.r,

                    child: const SizedBox.shrink(), // or any other widget
                  ),
                ),
              ],
            ),
          ),

        ),
      ],
    );
  }
}
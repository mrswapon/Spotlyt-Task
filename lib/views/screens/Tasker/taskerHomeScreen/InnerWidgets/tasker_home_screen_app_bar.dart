import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TaskerHomeScreenAppBar extends StatelessWidget {
  TaskerHomeScreenAppBar({
    super.key,
  });

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var profileData = _profileController.profileModel.value;
      return Row(
        children: [
          ///---------------------profile image------------------------>
          profileData.image?.url == null
              ? CircleAvatar(
                  radius: 20.r,
                  backgroundImage:
                      const AssetImage(AppImages.no_internet_profile),
                )
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                      "${ApiConstants.baseUrl}/${profileData.image!.url}"),
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
                  text: "${profileData.fullName}",
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
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  shape: BoxShape.circle),
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
    });
  }
}

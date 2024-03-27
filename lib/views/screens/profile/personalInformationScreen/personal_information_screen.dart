import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_list_lile.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/top_container_section.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var profileName = _profileController.profileModel?.data?.attributes ?? "";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        leading: const SizedBox(),
        title: CustomText(
          text: AppString.personalInformation,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            //==================================> TopContainer Section <=================================
             TopContainerSection(
              name: _profileController.profileModel?.data?.attributes?.fullName,
              image: _profileController.profileModel?.data?.attributes?.image?.url,
            ),
            SizedBox(height: 24.h),
            //==================================> CustomContainer Section <=================================

            SizedBox(height: 24.h),

            ///-----------------------profile name---------------------->
            CustomListTile(
                title: '${_profileController.profileModel?.data?.attributes?.fullName}',
                prefixIcon: _prefixIcon(AppIcons.person)),
            SizedBox(height: 16.h),
            ///-------------------profile email---------------------->
            CustomListTile(
                title: '${_profileController.profileModel?.data?.attributes?.email}',
                prefixIcon: _prefixIcon(AppIcons.mail)),
            SizedBox(height: 16.h),
            ///---------------------profile phone number------------------------>
            CustomListTile(
                title: '${_profileController.profileModel?.data?.attributes?.phoneNumber}',
                prefixIcon: _prefixIcon(
                  AppIcons.phone,
                )),
            SizedBox(height: 16.h),
            CustomListTile(
                title: '${_profileController.profileModel?.data?.attributes?.dataOfBirth}',
                prefixIcon: _prefixIcon(AppIcons.calendar)),
            SizedBox(height: 16.h),
            ///--------------------------Nid number------------------------>
            CustomListTile(
                title: '${_profileController.profileModel?.data?.attributes?.nidNumber}',
                prefixIcon: _prefixIcon(AppIcons.creditCard)),
            SizedBox(height: 16.h),

            ///-----------------------------location---------------------->
            CustomListTile(
              title: '${_profileController.profileModel?.data?.attributes?.address}',
              prefixIcon: _prefixIcon(AppIcons.location),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

//===========================================> CustomContainer Section <=================================

  _customContainer(String name, String title) {
    return Container(
      width: 165.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          border: Border.all(width: 1.w, color: AppColors.primaryColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 9.h),
        child: Column(
          children: [
            CustomText(
              text: name,
            ),
            CustomText(
              text: title,
            ),
          ],
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return SvgPicture.asset(icon, color: AppColors.primaryColor);
  }
}

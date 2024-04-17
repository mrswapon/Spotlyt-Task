import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_list_lile.dart';
import '../../../widgets/custom_text.dart';
import 'InnerWidget/top_container_section.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var profileData = _profileController.profileModel.value;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        // leading: const SizedBox(),
        title: CustomText(
          text: AppString.personalInformation,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              //==================================> TopContainer Section <=================================
              TopContainerSection(
                ontap: () {
                  var data = _profileController.profileModel.value;
                  Get.toNamed(AppRoutes.updateProfileScreen, parameters: {
                    "name": '${data.fullName}',
                    "email": '${data.email}',
                    "phone": '${data.phoneNumber}',
                    "dateOfBirth": '${data.dataOfBirth}',
                    "nidNo": '${data.nidNumber}',
                    "address": '${data.address}',
                    "image": '${data.image!.url}',
                  });
                },
                name: _profileController.profileModel.value.fullName,
                image: _profileController.profileModel.value.image?.url,
              ),
              SizedBox(height: 24.h),
              //==================================> CustomContainer Section <=================================

              SizedBox(height: 24.h),

              ///-----------------------profile name---------------------->
              CustomListTile(
                  title: '${profileData.fullName}',
                  prefixIcon: _prefixIcon(AppIcons.person)),
              SizedBox(height: 16.h),

              ///-------------------profile email---------------------->
              CustomListTile(
                  title: '${profileData.email}',
                  prefixIcon: _prefixIcon(AppIcons.mail)),
              SizedBox(height: 16.h),

              ///---------------------profile phone number------------------------>
              CustomListTile(
                  title: profileData.phoneNumber == null
                      ? "(000) 000-0000"
                      : '${profileData.phoneNumber}',
                  prefixIcon: _prefixIcon(
                    AppIcons.phone,
                  )),
              SizedBox(height: 16.h),

              ///==================date picker==================================>
              CustomListTile(
                  title: profileData.dataOfBirth == null ||
                          profileData.dataOfBirth!.isEmpty
                      ? "MM/DD/YYYY"
                      : '${profileData.dataOfBirth}',
                  prefixIcon: _prefixIcon(AppIcons.calendar)),


              ///======================if role is clint show nid or if role is employee don't show nid field=============L>
              profileData.role != "employee"
                  ? const SizedBox()
                  : SizedBox(height: 16.h),

              ///--------------------------Nid number------------------------>
              profileData.role != "employee"
                  ? const SizedBox()
                  : CustomListTile(
                      title: profileData.nidNumber == null
                          ? "NID Number"
                          : '${profileData.nidNumber}',
                      prefixIcon: _prefixIcon(AppIcons.creditCard)),
              SizedBox(height: 16.h),

              ///-----------------------------location---------------------->
              CustomListTile(
                title:
                    profileData.address == null || profileData.address!.isEmpty
                        ? 'Your address'
                        : '${profileData.address}',
                prefixIcon: _prefixIcon(AppIcons.location),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return SvgPicture.asset(icon, color: AppColors.primaryColor);
  }
}

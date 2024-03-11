import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text_field.dart';
import 'InnerWidgets/top_profile_card.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});


  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardCVVController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          ///------------------------------top profile card------------------------------------>
          TopProfileCard(),



      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [


            ///--------------------------personal information---------------------------->
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.primaryColor)
              ),
              child: ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.personalInformationScreen);
                },
                title: CustomText(text: AppString.personalInformation, textAlign: TextAlign.start,),
                leading : SvgPicture.asset(AppIcons.profile,color: AppColors.primaryColor,),
              ),
            ),
            SizedBox(height: 16.h,),



            ///--------------------------setting ---------------------------->
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primaryColor)
              ),
              child: ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.settingsScreen);

                },
                title: CustomText(text: AppString.settings, textAlign: TextAlign.start,),
                leading : SvgPicture.asset(AppIcons.setting,color: AppColors.primaryColor,),
              ),
            ),
            SizedBox(height: 16.h,),




            ///--------------------------Invite & Earn---------------------------->
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primaryColor)
              ),
              child: ListTile(
                onTap: (){
                   Get.toNamed(AppRoutes.inviteEarnScreen);

                },
                title: CustomText(text: AppString.inviteAndEarn, textAlign: TextAlign.start,),
                leading : SvgPicture.asset(AppIcons.share,color: AppColors.primaryColor,),
              ),
            ),
            SizedBox(height: 16.h,),




            ///--------------------------log out---------------------------->
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primaryColor)
              ),
              child: ListTile(
                onTap: (){

                },
                title: CustomText(text: AppString.logOut, textAlign: TextAlign.start,),
                leading : SvgPicture.asset(AppIcons.logout,color: AppColors.primaryColor,),
              ),
            ),


          ],
        ),
      ),


        ],
      ),
    );
  }
}


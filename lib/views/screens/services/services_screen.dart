import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/cetegory_botton.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 24.w,),
            GestureDetector(
                onTap: (){Get.back();},
                child: const Icon(Icons.keyboard_arrow_left))
          ],
        ),



        title: CustomText(text: AppString.requestForServices,fontsize: 18.h,fontWeight: FontWeight.w500,),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [

            CustomText(text: AppString.selectCategoryThatYouWantService,fontWeight: FontWeight.w500,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CetegoryBotton(
                name: "facebook",
                 icon: AppIcons.facebook,

              ),


              CetegoryBotton(
                name: "facebook",
                icon: AppIcons.facebook,

              ),


              CetegoryBotton(
                name: "facebook",
                icon: AppIcons.facebook,

              ),
            ],
          )


          ],
        ),
      ),

    );
  }
}






class CetegoryBotton extends StatelessWidget {
  VoidCallback onTap;
  final String? icon;
  final String? name;
  const CetegoryBotton({super.key, this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),

            ///-------------------------botton icon--------------------------->
            child: SvgPicture.asset(
              "$icon",
              color: Colors.white,
              width: 14.w,
              height: 14.h,
              fit: BoxFit.cover,
            ),
          ),

          ///----------------------------botton name----------------------------->
          CustomText(
            text: "$name",
            color: Colors.white,
            fontsize: 12.h,
            fontWeight: FontWeight.w500,
            right: 14.w,
            left: 4.w,
          )
        ],
      ),
    );
  }
}


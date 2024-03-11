import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';

class InviteEarnScreen extends StatelessWidget {
  const InviteEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---------------------------------app bar------------------------------>
      appBar: AppBar(
        title: CustomText(
          text: AppString.inviteAndEarn,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 34.h,
          ),

          ///---------------------------top image------------------------------->
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.earnImage,
                width: 260.w,
                height: 250.h,
                fit: BoxFit.fill,
              )),

          ///-----------------------------invite your friends and get rand text-------------------->
          CustomText(
            text: AppString.inviteYourFriendsAndGetRand,
            fontsize: 24.h,
            fontWeight: FontWeight.w500,
            top: 34.h,
            bottom: 16.h,
          ),

          ///--------------------------share the link below or ask text--------------------------->
          CustomText(
            text: AppString.shareTheLinkBeloworAsk,
          ),




          ///----------------------------copy link card--------------------------->
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Center(
              child: DottedBorder(
                padding: const EdgeInsets.all(0),
                dashPattern: [12,5],
                color: Colors.green,
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: Radius.circular(8.r),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffBFD8BF),
                      borderRadius: BorderRadius.circular(8.r)
                  ),
                  width: double.infinity,
                  height: 56.h,
                  child:  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Link",
                            fontsize: 18.h,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.copy,
                                color: AppColors.primaryColor,
                              ),
                              CustomText(
                                text: "Copy Link",
                                fontsize: 14.h,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Spacer(),
          ///--------------------------invite friends botton------------------------------><

          CustomButton(title: "Invite Friends", onpress: () {}),

          SizedBox(
            height: 44.h,
          )
        ],
      ),
    );
  }
}

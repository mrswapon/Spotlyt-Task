import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';

class TaskCard extends StatelessWidget {
  final double? weight;
  final double? bgImageheights;
  final String? amount;

  const TaskCard({super.key, this.weight, this.bgImageheights, this.amount});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: weight ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ///----------------------------------bg image-------------------------------->
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r))),
            child: Image.asset(
              AppImages.taskCardImage,
              height: bgImageheights?? 174.h,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///-------------------------facebook post 5k like----------------------------->
                CustomText(
                  text: "Facebook Post 5K Like ",
                  fontsize: 22.h,
                  fontWeight: FontWeight.w600,
                  bottom: 10.h,
                ),

                ///--------------------------date------------------------------->
                CustomText(
                  text: "Friday 01 Feb, 2024",
                  fontsize: 14.h,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black5C5C5C,
                  bottom: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///-------------------------5 days -------------------------->
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.calendar,
                          height: 17.h,
                          width: 16.w,
                          color: AppColors.black5C5C5C,
                        ),
                        CustomText(
                            text: "5 Days",
                            fontsize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black5C5C5C,
                            left: 8.w),
                      ],
                    ),



                    ///---------------------------amount not equal null amount text------------------------>
                    amount != null ?
                    CustomText(
                        text: "$amount",
                        fontsize: 14.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black5C5C5C,
                        left: 8.w) : SizedBox(),
                  ],
                ),

                ///------------------------task link------------------------------->
                CustomText(
                  text: "Task Link",
                  fontsize: 16.h,
                  fontWeight: FontWeight.w500,
                  top: 20.h,
                  bottom: 14.h,
                ),

                ///---------------------------------link-------------------------------------->
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.primaryColor),
                  child: CustomText(
                    text: "https://www.Facebook.com/Image \n Post",
                    color: Colors.white,
                    fontsize: 12.h,
                    textAlign: TextAlign.start,
                    maxline: 10,
                    top: 10.h,
                    bottom: 10.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

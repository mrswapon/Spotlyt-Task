import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TaskerTaskCard extends StatelessWidget {
  final String? faceBookPost;
  final String? date;
  final String? days;
  final String? postLink;
  final double? weight;
  final double? bgImageheights;
  final String? amount;
  final String? taskCompleteAmount;

  const TaskerTaskCard(
      {super.key,
      this.weight,
      this.bgImageheights,
      this.amount,
      this.faceBookPost,
      this.date,
      this.days,
      this.postLink,
      this.taskCompleteAmount});

  @override
  Widget build(BuildContext context) {
    ///=======================convert Amount String to Double=====================>
    double amountConvertToDouble;
    if (taskCompleteAmount != null) {
    amountConvertToDouble = double.parse(taskCompleteAmount!);
    } else {
      amountConvertToDouble = double.parse(amount!);
    }



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
              height: bgImageheights ?? 174.h,
            ),
          ),
          Container(
            padding: EdgeInsets.all(17.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///-------------------------facebook post 5k like----------------------------->
                CustomText(
                  text: faceBookPost ?? "Facebook Post Like ",
                  fontsize: 22.h,
                  fontWeight: FontWeight.w600,
                  bottom: 10.h,
                ),

                ///--------------------------date------------------------------->
                CustomText(
                  text: date ?? "Friday 01 Feb, 2024",
                  fontsize: 14.h,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black5C5C5C,
                  bottom: 14.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///-------------------------5 days -------------------------->
                    taskCompleteAmount != null
                        ? CustomText(
                            text: "R ${amountConvertToDouble/ 2}",
                            fontsize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                    )
                        : Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.calendar,
                                height: 17.h,
                                width: 16.w,
                                color: AppColors.black5C5C5C,
                              ),
                              CustomText(
                                  text: days ?? "5 Days",
                                  fontsize: 14.h,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black5C5C5C,
                                  left: 8.w),
                            ],
                          ),

                    ///---------------------------amount not equal null amount text------------------------>
                    amount != null
                        ? CustomText(
                            text: "R ${amountConvertToDouble /2}",
                            fontsize: 14.h,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black5C5C5C,
                            left: 8.w)
                        : const SizedBox(),
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                    child: CustomText(
                      textOverflow: TextOverflow.ellipsis,
                      text: postLink ?? "https://www.Facebook.com/Image \n Post",
                      color: Colors.white,
                      fontsize: 12.h,
                      textAlign: TextAlign.start,
                      maxline: 2,
                    ),
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

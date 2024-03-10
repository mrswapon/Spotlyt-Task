import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimentions.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------------app bar section-------------------------->
      appBar: AppBar(
        title: CustomText(
          textAlign: TextAlign.start,
          text: "Notifiacation",
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),

      ///-----------------------------------body section-------------------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15),
        child: Column(
          children: [
            ///-----------------------notification------------------------>

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child:  _Notification(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _Notification() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w, right: 7.w),
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: SvgPicture.asset(
                  AppIcons.bellIcon,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your task has been completed. ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.fontSizeLarge.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    top: 2.h,
                    text: "2 hours ago",
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    color : const Color(0xff767676),
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

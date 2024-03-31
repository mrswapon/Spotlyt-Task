import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_icons.dart';

class TaskerWalletScreen extends StatelessWidget {
  const TaskerWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.wallet,
          fontWeight: FontWeight.w500,
          fontsize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20.h,
          ),

          ///============================total balance card==================================>
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.fillColorGreenA0,
                border: Border.all(color: AppColors.primaryColor, width: 2.sp)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 51.h),
              child: Column(
                children: [
                  CustomText(text: AppString.totalBalance, fontsize: 24.h),
                  CustomText(
                      text: "R 55.50",
                      fontsize: 30.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ],
              ),
            ),
          ),
          //========================> Minimum And Maximum Withdrawal Balance <========================
          SizedBox(
            height: 24.h,
          ),
          CustomText(
              text: AppString.minimumWithdrawal,
              fontsize: 14.h,
              color: Colors.black),
          SizedBox(height: 12.h),
          CustomText(
              text: AppString.maximumWithdrawal,
              fontsize: 14.h,
              color: Colors.black),
          SizedBox(height: 24.h),
          //==========================> Last Withdrawal Row Button <============================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: AppString.lastWithdrawal,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              //======================> See All History Button <==========================
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.withdrawalHistory);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                          color: AppColors.primaryColor, width: 1.sp)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.3.w),
                    child: CustomText(
                      text: AppString.seeAllHistory,
                      fontsize: 12.h,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //======================> List View Item Section <======================
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.withDrawIcon,
                        width: 48.w,
                        height: 48.h,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppString.withDrawal,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          SizedBox(height: 6.h),
                          CustomText(
                            text: '2024 Jan 16',
                            fontWeight: FontWeight.w500,
                            fontsize: 12.h,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: '-\$120',
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                          SizedBox(height: 6.h),
                          CustomText(
                            text: 'Pending',
                            fontWeight: FontWeight.w500,
                            fontsize: 12.h,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //========================> Request for withdraw Button <=================
          CustomButton(title: AppString.requestForWithdraw, onpress: () {}),
          SizedBox(height: 24.h)
        ]),
      ),
    );
  }
}

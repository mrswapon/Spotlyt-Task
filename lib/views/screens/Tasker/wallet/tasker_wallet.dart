import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class TaskerWalletScreen extends StatelessWidget {
  const TaskerWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: AppString.wallet,),),


      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
        child: Column(
            children: [

              SizedBox(height: 20.h,),
              ///============================total balance card==================================>
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.fillColorGreenA0,
                    border: Border.all(color: AppColors.primaryColor, width: 2.sp)
                ),


                child: Padding(
                  padding:  EdgeInsets.symmetric( vertical: 51.h),
                  child: Column(
                    children: [

                      CustomText(text: AppString.totalBalance,
                        fontsize: 24.h,
                        fontWeight: FontWeight.w400,),

                      CustomText(
                        text: "R 55.50",
                        fontsize: 30.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,),
                    ],
                  ),
                ),
              ),


            ]
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../utils/app_colors.dart';


class CustomQuentityCard extends StatelessWidget {
  const CustomQuentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return             Container(
      height: 60.h,
      decoration: BoxDecoration(
          color: AppColors.fillColorGreen,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ///-------------------------------Quantity decrement Botton---------------------------->
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
                padding: EdgeInsets.all(6.r),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
          ),
          ///------------------------------quantity text-----------------------------?
          CustomText(
            text: "1000",
            left: 16.w,
            right: 16.w,
          ),

          ///-------------------------------Quantity decrement Botton---------------------------->
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
                padding: EdgeInsets.all(6.r),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}


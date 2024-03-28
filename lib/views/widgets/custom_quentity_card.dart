import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../utils/app_colors.dart';


class CustomQuentityCard extends StatefulWidget {
  CustomQuentityCard({super.key, required this.decrement,required this.increment,this.quantityCounter});
  final VoidCallback decrement;
  final VoidCallback increment;
  final int? quantityCounter;


  @override
  State<CustomQuentityCard> createState() => _CustomQuentityCardState();
}

class _CustomQuentityCardState extends State<CustomQuentityCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
          color: AppColors.fillColorGreen,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ///-------------------------------Quantity decrement Botton---------------------------->
          GestureDetector(
            onTap: widget.decrement,
            child: Container(
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
          ),
          ///------------------------------quantity text-----------------------------?
          CustomText(
            text: widget.quantityCounter.toString(),
            left: 16.w,
            right: 16.w,
          ),

          ///-------------------------------Quantity increment Botton---------------------------->
          GestureDetector(
            onTap: widget.increment,
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }
}


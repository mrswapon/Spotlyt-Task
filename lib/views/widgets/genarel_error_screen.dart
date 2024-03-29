import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:spotlyt_task/utils/app_colors.dart';

import '../../utils/app_icons.dart';
import '../../utils/app_images.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen({super.key,required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SvgPicture.asset(AppIcons.noInternetImage),
            SizedBox(height: 20.h,),
            Text("Something wrong!",style:TextStyle(fontWeight: FontWeight.w500,fontSize:16.sp),),
            SizedBox(height: 20.h,),
            ElevatedButton(onPressed:onTap,
              style:ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(20, 40),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(32.r),
                        bottomLeft: Radius.circular(32.r),
                      )
                  )


              ), child:const Text("Try Again",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),


            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 24.w,),
            const Icon(Icons.keyboard_arrow_left)
          ],
        ),



        title: CustomText(text: AppString.requestForServices,fontsize: 18.h,fontWeight: FontWeight.w500,),
      ),

      body: Column(
        children: [



        ],
      ),

    );
  }
}

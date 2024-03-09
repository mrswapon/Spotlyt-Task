import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/cetegory_botton.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 24.w,),
            GestureDetector(
                onTap: (){Get.back();},
                child: const Icon(Icons.keyboard_arrow_left))
          ],
        ),



        title: CustomText(text: AppString.requestForServices,fontsize: 18.h,fontWeight: FontWeight.w500,),
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [

            CustomText(text: AppString.selectCategoryThatYouWantService,fontWeight: FontWeight.w500,),


          Row(
            children: [
              CetegoryBotton(
                name: "facebook",
                 icon: AppIcons.facebook,

              ),


              CetegoryBotton(
                name: "facebook",
                icon: AppIcons.facebook,

              ),


              CetegoryBotton(
                name: "facebook",
                icon: AppIcons.facebook,

              ),
            ],
          )


          ],
        ),
      ),

    );
  }
}

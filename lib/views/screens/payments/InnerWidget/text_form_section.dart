
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text_field.dart';

class TextFormSection extends StatelessWidget {
  TextFormSection({super.key});


  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardCVVController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ///------------------------card name form---------------------->
        CustomTextField(
          contenpaddingHorizontal: Dimensions.paddingSizeDefault.w,
          contenpaddingVertical: 15.h,
          controller: cardNameController,
          hintText: AppString.cardHolderName,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppIcons.person,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),


        ///------------------------card number form---------------------->
        CustomTextField(
          contenpaddingHorizontal: Dimensions.paddingSizeDefault.w,
          contenpaddingVertical: 15.h,
          controller: cardNumberController,
          hintText: AppString.cardNumber,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppIcons.creditCard,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),


        ///------------------------card cvv form---------------------->
        CustomTextField(
          contenpaddingHorizontal: Dimensions.paddingSizeDefault.w,
          contenpaddingVertical: 15.h,
          controller: cardCVVController,
          hintText: "CVV/CVC",
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppIcons.lockClosed,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),


        ///------------------------card date or mm form---------------------->
        CustomTextField(
          contenpaddingHorizontal: Dimensions.paddingSizeDefault.w,
          contenpaddingVertical: 15.h,
          controller: cardDateController,
          hintText: "MM/YY",
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppIcons.calendar,
              color: AppColors.primaryColor,
            ),
          ),
        ),


      ],
    );
  }
}


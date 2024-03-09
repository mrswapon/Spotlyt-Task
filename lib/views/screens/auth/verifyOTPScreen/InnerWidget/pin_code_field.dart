import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../utils/app_colors.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(

      backgroundColor: Colors.transparent,
      cursorColor: AppColors.primaryColor,
      textStyle: const TextStyle(color: Colors.black),
      autoFocus: false,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(

          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),

          selectedColor: AppColors.primaryColor,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          fieldHeight: 57.h,
          fieldWidth: 44.w,
          inactiveColor: Colors.grey,
          activeColor: AppColors.primaryColor),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}

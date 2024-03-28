import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacrter;
  final Color? filColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double contenpaddingHorizontal;
  final double contenpaddingVertical;
  final Widget? sufixicons;
  final FormFieldValidator? validator;
  final VoidCallback? ontapPrefix;


  const CustomTextField({
    super.key,
    required this.contenpaddingHorizontal,
    required this.contenpaddingVertical,
    this.hintText,
    this.prefixIcon,
    this.sufixicons,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacrter = '*',
    this.filColor,
    this.labelText,
    this.ontapPrefix

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacrter!,
      validator: validator,
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: contenpaddingHorizontal.toDouble(),
            vertical: contenpaddingVertical.toDouble()),
        filled: true,
        fillColor: filColor ?? const Color(0xFFFFFFFF),
        prefixIcon: GestureDetector(
            onTap: ontapPrefix,
            child: prefixIcon),
        suffixIcon: sufixicons,
        prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        errorStyle: const TextStyle(color: Colors.red),
        suffixIconColor: AppColors.primaryColor,
        prefixIconColor: AppColors.primaryColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle:
            const TextStyle(color: Color(0xFF5C5C5C), fontFamily: 'Lato/R 16', fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.w,
        color: AppColors.primaryColor,
      ),
    );
  }
}

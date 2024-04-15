// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:spotlyt_task/utils/app_colors.dart';
// import 'package:spotlyt_task/views/widgets/custom_text.dart';
//
// class CustomButton extends StatelessWidget {
//   final VoidCallback onpress;
//   final String title;
//   final Color? color;
//   final Color? titlecolor;
//   final double? height;
//   final double? fontSize;
//   final bool isLoading;
//
//   const CustomButton({
//     super.key,
//     required this.title,
//     required this.onpress,
//     this.color,
//     this.height,
//     this.fontSize,
//     this.titlecolor,
//     this.isLoading=false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onpress,
//       child: Container(
//         width: 353.w,
//         height: height ?? 52.h,
//         padding: EdgeInsets.all(10.h),
//         decoration: color == null
//             ? ShapeDecoration(
//                 color:  const Color(0xFF318130),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.r)),
//               )
//             : ShapeDecoration(
//                 color: color,
//                 shape: RoundedRectangleBorder(
//                     side: const BorderSide(color: AppColors.primaryColor),
//                     borderRadius: BorderRadius.circular(8.r)),
//               ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomText(
//               text: title,
//               fontsize: fontSize ?? 18.h,
//               color: titlecolor ?? Colors.white,
//               fontName: 'Lato',
//               fontWeight: FontWeight.w400,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';



class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.color,this.textStyle, this.padding =EdgeInsets.zero, required this.onpress,required this.title ,this.loading=false,this.width,this.height});
  final Function() onpress;
  final String title;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final  TextStyle? textStyle;


  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: ElevatedButton(onPressed:loading? (){}:onpress,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)
            ),
            backgroundColor: color??AppColors.primaryColor,
            minimumSize:Size(width??Get.width, height??53.h),

          ),
          child:loading?  SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(color: Colors.white,),
          ):Text(title,style:textStyle?? const TextStyle(fontWeight: FontWeight.w500,color:Colors.white),)),
    );
  }
}
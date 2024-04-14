// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../../../controller/submitController/submit_controller.dart';
// import '../../../../../utils/app_colors.dart';
// import '../../../../widgets/custom_text.dart';
//
// class ShowImagePicker {
//   void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: AppColors.scaffoldBg,
//         context: context,
//         builder: (builder) {
//           return Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 4.2,
//               child: Expanded(
//                 child: InkWell(
//                   onTap: () {
//                     submitController.pickImageFromGallery();
//                   },
//                   child: SizedBox(
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.image,
//                           size: 50.w,
//                           color: AppColors.primaryColor,
//                         ),
//                         CustomText(text: 'Gallery')
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
//
//

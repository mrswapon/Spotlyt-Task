import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/submitController/submit_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';
import 'InnerWidget/show_image_picker.dart';

class SubmitTaskScreen extends StatefulWidget {
  SubmitTaskScreen({super.key, this.showImagePicker});

  final ShowImagePicker? showImagePicker;
  SubmitController submitController = Get.put(SubmitController());

  @override
  State<SubmitTaskScreen> createState() => _SubmitTaskScreenState();
}

class _SubmitTaskScreenState extends State<SubmitTaskScreen> {
  ShowImagePicker showImagePicker = ShowImagePicker();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: CustomText(
          text: AppString.submitTask,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //===============================> Task Name Text-field <===============================
                // CustomTextField(
                //   contenpaddingHorizontal: 16.w,
                //   contenpaddingVertical: 14.h,
                //   controller: _taskNameController,
                //   hintText: AppString.taskName,
                // ),
                // SizedBox(height: 16.h),
                // //===============================> Task Category Text-field <===============================
                // CustomTextField(
                //   contenpaddingHorizontal: 16.w,
                //   contenpaddingVertical: 14.h,
                //   controller: _taskCategoryController,
                //   hintText: AppString.taskCategory,
                // ),
                SizedBox(height: 16.h),
                //=====================================> Upload Your Task Section <======================================
                Center(
                  child: Column(
                    children: [
                      widget.submitController.image != null
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: AppColors.primaryColor)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 95.w, vertical: 9.h),
                                child: Image.memory(
                                  widget.submitController.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: AppColors.primaryColor)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 97.h),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          widget.submitController
                                              .pickImageFromGallery();
                                        },
                                        child: Icon(Icons.add_circle_outline,
                                            weight: 30.w, size: 30.h)),
                                    CustomText(
                                      top: 6.h,
                                      text: AppString.uploadTaskScreenshot,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 340.h),
                //===============================> task completed Button <===============================
                CustomButton(
                    title: AppString.submitTask,
                    onpress: () {
                      Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                    }),
                SizedBox(height: 54.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}

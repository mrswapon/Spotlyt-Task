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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //===============================> Task Name Text-field <===============================
                  CustomTextField(
                    contenpaddingHorizontal: 16.w,
                    contenpaddingVertical: 14.h,
                    controller: _taskNameController,
                    hintText: AppString.taskName,
                  ),
                  SizedBox(height: 16.h),
                  //===============================> Task Category Text-field <===============================
                  CustomTextField(
                    contenpaddingHorizontal: 16.w,
                    contenpaddingVertical: 14.h,
                    controller: _taskCategoryController,
                    hintText: AppString.taskCategory,
                  ),
                  SizedBox(height: 16.h),
                  //=====================================> Upload Your Task Section <======================================
                  Center(
                    child: Column(
                      children: [
                        widget.submitController.image != null
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
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
                                    borderRadius: BorderRadius.circular(30.r),
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
                                              weight: 24.w, size: 24.h)),
                                      CustomText(
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
                  SizedBox(height: 239.h),
                  //===============================> Change Password Button <===============================
                  CustomButton(
                      title: AppString.taskCompleted,
                      onpress: () {
                        Get.toNamed(AppRoutes.verifyOtpScreen);
                      }),
                  SizedBox(height: 54.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

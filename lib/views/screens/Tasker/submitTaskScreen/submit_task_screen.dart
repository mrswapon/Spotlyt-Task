import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../controller/Tasker_controller/tasker_home_controller.dart';
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

  @override
  State<SubmitTaskScreen> createState() => _SubmitTaskScreenState();
}

class _SubmitTaskScreenState extends State<SubmitTaskScreen> {


  final  _taskerHomeController= Get.put(TaskerHomeController());

  var parameter = Get.parameters;
  Uint8List? image;
  File? selectedImage;

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
                        image != null
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
                              image!,
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
                                     pickImageFromGallery();
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
                      print("==============> ddd ${parameter['sId']}");
                      _taskerHomeController.submitTask("${parameter['sId']}",selectedImage as File);
                    }),
                SizedBox(height: 54.h),
              ],
            )
          ],
        ),
      ),
    );
  }




  //==================================> Gallery <===============================
  Future pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = File(returnImage.path).readAsBytesSync();
    });
  }
}

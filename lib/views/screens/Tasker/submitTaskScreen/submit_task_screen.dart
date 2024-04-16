import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotlyt_task/controller/Tasker_controller/tasker_task_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SubmitTaskScreen extends StatefulWidget {
  @override
  State<SubmitTaskScreen> createState() => _SubmitTaskScreenState();
}

class _SubmitTaskScreenState extends State<SubmitTaskScreen> {
  final _taskerHomeController = Get.put(TaskerTaskController());

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
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: AppString.takeScreenshot,
                  maxline: 4,
                ),
                SizedBox(height: 32.h),
                //=====================================> Upload Your Task Section <======================================
                Center(
                  child: Column(
                    children: [
                      image != null
                          ? Container(
                              height: 235.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1.w,
                                      color: AppColors.primaryColor)),
                              child: Image.memory(
                                image!,
                                fit: BoxFit.cover,
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

                SizedBox(height: 271.h),
                //===============================> task completed Button <===============================
                CustomButton(
                    title: AppString.submitTask,
                    onpress: () {
                      print("==============> ddd ${parameter['sId']}");
                      _taskerHomeController.submitTask(
                          "${parameter['sId']}", selectedImage!);
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

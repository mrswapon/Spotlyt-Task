import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Tasker_controller/tasker_task_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_strings.dart';
import 'custom_text.dart';

class CustomTwoBotton extends StatelessWidget {
  CustomTwoBotton({super.key});

  final _taskerTaskController = Get.put(TaskerTaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: double.infinity,
      decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8.r),
          // border: Border.all(color: AppColors.primaryColor)
      ),

      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Obx(() => GestureDetector(
                  onTap: () {
                    _taskerTaskController.isSelected(true);
                    _taskerTaskController.setStatus("submitted");
                   _taskerTaskController.fastLoad();
                  },

                  ///---------------------------Submitted botton----------------------->
                  child: Container(
                    decoration: BoxDecoration(
                        color: _taskerTaskController.isSelected.value
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                            topLeft: Radius.circular(8.r))),
                    child: Center(
                      child: CustomText(
                        text: AppString.submitted,
                        fontsize: 20.h,
                        color: _taskerTaskController.isSelected.value
                            ? Colors.white
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Obx(() => GestureDetector(
                  onTap: () {
                    _taskerTaskController.isSelected(false);
                    _taskerTaskController.setStatus("accepted");
                    _taskerTaskController.fastLoad();
                  },

                  ///-------------------------- completed botton----------------------->
                  child: Container(
                    decoration: BoxDecoration(
                        color: _taskerTaskController.isSelected.value
                            ? Colors.white
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8.r),
                            topRight: Radius.circular(8.r))),
                    child: Center(
                      child: CustomText(
                        text: AppString.completed,
                        fontsize: 20.h,
                        color: _taskerTaskController.isSelected.value
                            ? AppColors.primaryColor
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

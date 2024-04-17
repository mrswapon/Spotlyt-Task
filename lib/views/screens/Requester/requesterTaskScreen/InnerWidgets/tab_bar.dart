import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Tasker_controller/tasker_task_controller.dart';

import '../../../../../controller/requesterController/requester_submit_task_controller.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/custom_text.dart';



class RequesterTaskTab extends StatelessWidget {
  RequesterTaskTab({super.key});

  final _requesterTaskController = Get.put(RequesterTaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        children: [
          ///---------------------------Submitted botton----------------------->
          Expanded(
            flex: 1,
            child: Obx(() => GestureDetector(
              onTap: () {
               _requesterTaskController.selectTab.value="pending";
               _requesterTaskController.fastLoad();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _requesterTaskController.selectTab.value=="pending"
                        ? AppColors.primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        topLeft: Radius.circular(8.r))),
                child: Center(
                  child: CustomText(
                    text: AppString.submitted,
                    fontsize: 20.h,
                    color:  _requesterTaskController.selectTab.value=="pending"
                        ? Colors.white
                        : AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )),
          ),
          ///-------------------------- completed botton----------------------->
          Expanded(
            flex: 1,
            child: Obx(() => GestureDetector(
              onTap: () {
                _requesterTaskController.selectTab.value="complete";
                _requesterTaskController.fastLoad();
              },
              child: Container(
                decoration: BoxDecoration(
                    color:  _requesterTaskController.selectTab.value=="pending"
                        ? Colors.white
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        topRight: Radius.circular(8.r))),
                child: Center(
                  child: CustomText(
                    text: AppString.completed,
                    fontsize: 20.h,
                    color:_requesterTaskController.selectTab.value=="pending"
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

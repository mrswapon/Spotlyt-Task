import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/app_strings.dart';
import 'custom_text.dart';

class CustomTwoBotton extends StatelessWidget {
  CustomTwoBotton({super.key});

  RxBool isSelected = true.obs;

  void toggleSelected() {
    isSelected.value = !isSelected.value;
  }

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
          Expanded(
            flex: 1,
            child: Obx(() => GestureDetector(
                  onTap: () {
                    toggleSelected();
                  },

                  ///---------------------------up comming botton----------------------->
                  child: Container(
                    decoration: BoxDecoration(
                        color: isSelected.value
                            ? AppColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                            topLeft: Radius.circular(8.r))),
                    child: Center(
                      child: CustomText(
                        text: AppString.running,
                        fontsize: 20.h,
                        color: isSelected.value
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
                    toggleSelected();
                  },

                  ///---------------------------up complete botton----------------------->
                  child: Container(
                    decoration: BoxDecoration(
                        color: isSelected.value
                            ? Colors.white
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8.r),
                            topRight: Radius.circular(8.r))),
                    child: Center(
                      child: CustomText(
                        text: AppString.completed,
                        fontsize: 20.h,
                        color: isSelected.value
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

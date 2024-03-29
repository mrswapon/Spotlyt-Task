import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_two_botton.dart';
import 'InnerWidgets/tasker_task_card.dart';

class TaskerTaskScreen extends StatelessWidget {
  const TaskerTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.task,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            ///------------------------two botton-----------------------------<
            CustomTwoBotton(),
            SizedBox(
              height: 16.h,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: 16.h, top: index == 0 ? 16.h : 0),
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.taskerTaskDetailsScreen);
                        },
                        child:  TaskerTaskCard()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

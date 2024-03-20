import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerHomeScreen/InnerWidgets/tasker_home_screen_app_bar.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_strings.dart';
import '../taskerTaskScreen/InnerWidgets/tasker_task_card.dart';

class TaskerHomeScreen extends StatelessWidget {
  const TaskerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),

            ///----------------------------------tasker home screen app bar-------------------------->
            TaskerHomeScreenAppBar(),

            SizedBox(
              height: 28.h,
            ),

            ///-----------------------------------today's task ------------------------------------->
            CustomText(
              text: AppString.todayTask,
              fontsize: 20.h,
              fontWeight: FontWeight.w600,
              bottom: 16.h,
            ),

            ///----------------------------today's task listview----------------------------->
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.taskerTaskDetailsScreen);
                      },
                      child: TaskerTaskCard(
                        bgImageheights: 110.h,
                        weight: 267.w,
                        amount: "R2000",
                        // heights: 110,
                      ),
                    ),
                  );
                },
              ),
            ),

            ///-----------------------------------Your Task ------------------------------------->
            CustomText(
              text: AppString.yourTask,
              fontsize: 20.h,
              fontWeight: FontWeight.w600,
              bottom: 16.h,
              top: 24.h,
            ),

            ///----------------------------Your task listview----------------------------->
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.taskerTaskDetailsScreen);
                      },
                      child: TaskerTaskCard(
                        bgImageheights: 110.h,
                        weight: 267.w,
                        amount: "R2000",
                        // heights: 110,
                      ),
                    ),
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

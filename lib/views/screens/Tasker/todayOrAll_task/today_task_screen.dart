import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerTaskScreen/InnerWidgets/tasker_task_card.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class TodayOrAllTaskScreen extends StatelessWidget {
  TodayOrAllTaskScreen({super.key});

  var parameter = Get.parameters;

  ///=============================Show today task or All Task Screen with screen Type==========================>
  ///===================This is got from Getx parameter=========================>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: parameter['screenType'] == "todaysTask" ?  AppString.todaysTask : AppString.allTask,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.homeCardDetails);
                },
                child: const TaskerTaskCard(
                  amount: "R2000",
                  faceBookPost: "Facebook Post Like ",
                  date: "Friday 01 Feb, 2024",
                  days: "5 Days",
                  postLink: "https://www.Facebook.com/Image \n Post",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

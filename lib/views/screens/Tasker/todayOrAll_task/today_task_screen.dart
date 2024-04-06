import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerTaskScreen/InnerWidgets/tasker_task_card.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../../controller/Tasker_controller/tasker_home_controller.dart';

class TodayOrAllTaskScreen extends StatelessWidget {
  TodayOrAllTaskScreen({super.key});

  final _taskerHomeController = Get.put(TaskerHomeController());

  var parameter = Get.parameters;

  ///=============================Show today task or All Task Screen with screen Type==========================>
  ///===================This is got from Getx parameter=========================>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: parameter['screenType'] == "todaysTask"
              ? AppString.todaysTask
              : AppString.allTask,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: ListView.builder(
          itemCount: parameter['screenType'] == "todaysTask"
              ? _taskerHomeController
                  .taskerHomeModelToday.value.data?.attributes?.tasks?.length
              : _taskerHomeController
                  .taskerHomeModelAll.value.data?.attributes?.tasks?.length,
          itemBuilder: (context, index) {
            var taskData = parameter['screenType'] == "todaysTask"
                ? _taskerHomeController
                    .taskerHomeModelToday.value.data?.attributes?.tasks![index]
                : _taskerHomeController
                    .taskerHomeModelAll.value.data?.attributes?.tasks?[index];
            DateTime? createdAt = taskData?.createdAt;
            var formattedDate = createdAt != null
                ? DateFormat.yMMMMd().add_jms().format(createdAt)
                : 'Unknown';
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.homeCardDetails);
                },
                child: TaskerTaskCard(
                  amount: "R2000",
                  faceBookPost: "${taskData?.name}",
                  date: formattedDate,
                  postLink: taskData?.taskLink,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

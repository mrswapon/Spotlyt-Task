import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../controller/Tasker_controller/tasker_home_controller.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_two_botton.dart';
import 'InnerWidgets/requester_task_card.dart';

class RequesterTaskScreen extends StatelessWidget {
  RequesterTaskScreen({Key? key}) : super(key: key);
  final TaskerHomeController _taskerHomeController =
  Get.put(TaskerHomeController());

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
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            CustomTwoBotton(),
            SizedBox(height: 16.h),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: _taskerHomeController.taskerHomeModelAll.value?.data?.attributes?.tasks?.length ?? 0,
                  itemBuilder: (context, index) {
                    final taskList = _taskerHomeController.taskerHomeModelAll.value?.data?.attributes?.tasks;
                    if (taskList != null && taskList.isNotEmpty) {
                      final allTaskDate = taskList[index];
                      final createdAt = allTaskDate?.createdAt;
                      final formattedDate = createdAt != null ? DateFormat.yMMMMd().add_jms().format(createdAt) : 'Unknown';
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: 16.h,
                          top: index == 0 ? 16.h : 0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.requesterTaskDetailsScreen);
                          },
                          child: RequesterTaskCard(
                            bgImageheights: 110.h,
                            weight: 267.w,
                            taskCompleteAmount: "${allTaskDate!.price}",
                            faceBookPost: allTaskDate.name,
                            postLink: "${allTaskDate.taskLink}\n",
                            date: formattedDate,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

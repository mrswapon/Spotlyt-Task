import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerHomeScreen/InnerWidgets/tasker_home_screen_app_bar.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import 'package:spotlyt_task/views/widgets/no_internet_screen.dart';
import '../../../../controller/Tasker_controller/tasker_home_controller.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_loader.dart';
import '../taskerTaskScreen/InnerWidgets/tasker_task_card.dart';

class TaskerHomeScreen extends StatelessWidget {
  TaskerHomeScreen({super.key});

  final TaskerHomeController _taskerHomeController =
      Get.put(TaskerHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch(_taskerHomeController.rxRequestStatus.value){
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(onTap: (){_taskerHomeController.getTaskerHomeDataAll(); _taskerHomeController.taskerHomeModelToday();},);
          case Status.error:
            return NoInternetScreen(onTap: (){_taskerHomeController.getTaskerHomeDataAll(); _taskerHomeController.taskerHomeModelToday();},);

          case Status.completed: return         Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault.w,
            ),
            child: SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppString.todayTask,
                        fontsize: 20.h,
                        fontWeight: FontWeight.w600,
                        bottom: 16.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.todayOrAllTaskScreen,
                              parameters: {"screenType": "todaysTask"});
                        },
                        child: CustomText(
                          text: AppString.seeAll,
                          fontsize: 15.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          bottom: 16.h,
                        ),
                      ),
                    ],
                  ),

                  ///----------------------------today's task listview----------------------------->
                  Obx(
                        () => SizedBox(
                      height: 257.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _taskerHomeController.taskerHomeModelToday.value
                            .data?.attributes?.tasks?.length,
                        itemBuilder: (context, index) {
                          var taskData = _taskerHomeController.taskerHomeModelToday.value.data?.attributes?.tasks?[index];
                          var date = taskData?.createdAt;
                          var formatDates = '';
                          if (date != null) {
                            formatDates =
                                DateFormat('EEEE dd MMM, yyyy').format(date);
                          } else {
                            null;
                          }

                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.taskerTaskDetailsScreen, arguments : taskData);
                              },
                              child: TaskerTaskCard(
                                bgImageheights: 110.h,
                                weight: 267.w,
                                taskCompleteAmount: "${taskData?.price}",
                                faceBookPost: taskData?.name,
                                date: formatDates,
                                // days: "5 Days",
                                postLink: '${taskData?.taskLink}\nPost',
                                // heights: 110,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16.h,
                  ),

                  ///-----------------------------------all Task ------------------------------------->
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppString.allTask,
                        fontsize: 20.h,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.todayOrAllTaskScreen,
                              parameters: {"screenType": "allTask"});
                        },
                        child: CustomText(
                          text: AppString.seeAll,
                          fontsize: 15.h,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  ///----------------------------Your task listview----------------------------->
                  Obx(
                        () => SizedBox(
                      height: 257.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _taskerHomeController.taskerHomeModelAll.value.data?.attributes?.tasks?.length,
                        itemBuilder: (context, index) {
                          var allTaskDate = _taskerHomeController.taskerHomeModelAll.value.data?.attributes?.tasks?[index];
                          var date = allTaskDate?.createdAt;
                          var formatDate = '';
                          if (date != null) {
                            formatDate =
                                DateFormat('EEEE dd MMM, yyyy').format(date);
                          } else {
                            null;
                          }
                          return Padding(
                            padding: EdgeInsets.only(right: 12.w),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.taskerTaskDetailsScreen, arguments : allTaskDate);
                              },
                              child: TaskerTaskCard(
                                bgImageheights: 110.h,
                                weight: 267.w,
                                taskCompleteAmount: "${allTaskDate?.price}" ?? "",
                                faceBookPost: allTaskDate?.name ?? "",
                                postLink: "${allTaskDate?.taskLink}\n" ?? "",
                                date: formatDate,
                                // heights: 110,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

        }
      }),
    );
  }
}

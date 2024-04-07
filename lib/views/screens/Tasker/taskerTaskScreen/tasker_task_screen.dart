import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/controller/Tasker_controller/tasker_task_controller.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_two_botton.dart';
import '../../../widgets/genarel_error_screen.dart';
import '../../../widgets/no_internet_screen.dart';
import 'InnerWidgets/tasker_task_card.dart';

class TaskerTaskScreen extends StatelessWidget {
  TaskerTaskScreen({super.key});

  final _taskerTaskController = Get.put(TaskerTaskController());

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
      body: Obx(() {
        switch(_taskerTaskController.rxRequestStatus.value){
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(onTap: (){_taskerTaskController.taskerTaskGet();},);
          case Status.error:
            return GeneralErrorScreen(onTap: (){_taskerTaskController.taskerTaskGet();},);

          case Status.completed: return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
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

                Obx(() =>
                    Expanded(
                      child: ListView.builder(
                        itemCount: _taskerTaskController.taskertaskModel.value.data?.attributes?.tasks?.length,
                        itemBuilder: (context, index) {
                          var taskerTask = _taskerTaskController.taskertaskModel.value.data?.attributes?.tasks?[index];


                          ///==================date formed================>
                          var date = taskerTask?.createdAt;
                          var formatDates = '';
                          if (date != null) {
                            var parsedDate = DateTime.parse(date);
                            formatDates = DateFormat('EEEE dd MMM, yyyy').format(parsedDate);
                          } else {
                            formatDates = 'Date is not available';
                          }

                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 16.h, top: index == 0 ? 16.h : 0),
                            child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.taskerTaskDetailsScreen);
                                },
                                child: TaskerTaskCard(
                                  faceBookPost: "${taskerTask?.name}",
                                  date: formatDates,
                                  taskCompleteAmount: "${taskerTask?.price}",
                                  postLink: "${taskerTask?.taskId?.taskLink}",
                                )),
                          );
                        },
                      ),
                    ),
                )
              ],
            ),
          );
        }



      }),
    );
  }
}

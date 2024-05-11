import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_circle_loader.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../controller/requesterController/requester_submit_task_controller.dart';
import '../../../../utils/app_strings.dart';
import 'InnerWidgets/requester_task_card.dart';
import 'InnerWidgets/tab_bar.dart';

class RequesterTaskScreen extends StatelessWidget {
  RequesterTaskScreen({Key? key}) : super(key: key);
  final _requesterTaskController = Get.put(RequesterTaskController());

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
            SizedBox(height: 24.h),
            RequesterTaskTab(),
            SizedBox(height: 16.h),
            Obx(() => Expanded(
                  child: _requesterTaskController.isFirstLoadRunning.value
                      ? const CustomLoader()
                      : _requesterTaskController.taskList.isEmpty
                          ? const Center(
                              child: Text("No Data Found!"),
                            )
                          : ListView.builder(
                              itemCount:
                                  _requesterTaskController.taskList.length + 1,
                              controller:
                                  _requesterTaskController.scrollController,
                              itemBuilder: (context, index) {

                                if (index ==
                                    _requesterTaskController.taskList.length) {
                                  return _requesterTaskController
                                          .isLoadMoreRunning.value
                                      ? const CustomCircleLoader()
                                      : const SizedBox();
                                } else {
                                  var data=_requesterTaskController.taskList[index];
                                  var totalPrice = data.price! * data.quantity!.toDouble();
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 16.h,
                                      top: index == 0 ? 16.h : 0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes
                                            .requesterTaskDetailsScreen,arguments: data);
                                      },
                                      child: RequesterTaskCard(
                                        taskCompleteAmount:"",
                                        amount:totalPrice,
                                        title:data.name,
                                        postLink:data.taskLink,
                                        date: data.createdAt,
                                      ),
                                    ),
                                  );
                                }
                              },
                            )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/controller/Tasker_controller/tasker_task_controller.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_constant.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/genarel_error_screen.dart';
import '../../../widgets/no_data_found.dart';
import '../../../widgets/no_internet_screen.dart';
import 'InnerWidgets/tasker_task_card.dart';

class TaskerTaskScreen extends StatefulWidget {
  TaskerTaskScreen({super.key});

  @override
  State<TaskerTaskScreen> createState() => _TaskerTaskScreenState();
}

class _TaskerTaskScreenState extends State<TaskerTaskScreen> {
  final _taskerTaskController = Get.put(TaskerTaskController());




  @override
  void initState() {
    _taskerTaskController.setStatus("submitted");
    _taskerTaskController.fastLoad();
    _taskerTaskController.scrollController.addListener(() {
      // if (scrollController.position.pixels ==
      //     scrollController.position.maxScrollExtent) {
      //   loadMore();
      // }
      if (_taskerTaskController.scrollController.offset >=
          _taskerTaskController.scrollController.position.maxScrollExtent &&
          !_taskerTaskController.scrollController.position.outOfRange) {
        _taskerTaskController.loadMore();
      }
      debugPrint("Load More Scroll Controller ");
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       DefaultTabController(
        length: 2,
        initialIndex: _taskerTaskController.tabBarIndex.value,
        child: Scaffold(
          appBar: AppBar(
            title: CustomText(
              text: AppString.task,
              fontsize: 18.h,
              fontWeight: FontWeight.w500,
            ),
            bottom: TabBar(
              ///==========================Tap Bar Design====================>
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primaryColor,
              dividerColor: Colors.transparent,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: Colors.black87,
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),

              ///=======================On Tap Tap Bar =============================>
              onTap: (value) {
               if (value == 0) {
                  _taskerTaskController.tabBarIndex.value = 0;
                  _taskerTaskController.isSelected(true);
                  _taskerTaskController.setStatus("submitted");
                  _taskerTaskController.fastLoad();
                } else if (value == 1) {
                  _taskerTaskController.tabBarIndex.value = 1;
                  _taskerTaskController.isSelected(true);
                  _taskerTaskController.setStatus("accepted");
                  _taskerTaskController.fastLoad();
                }
              },

              ///======================Tap Bar Items===============================>
              tabs: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(AppString.submitted),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Text(AppString.completed)),
              ],
            ),
          ),

          ///==================================Body Section========================>?
          body: Obx(() {
            switch (_taskerTaskController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return NoInternetScreen(
                  onTap: () {
                    _taskerTaskController.fastLoad();
                  },
                );
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    _taskerTaskController.fastLoad();
                  },
                );

              case Status.completed:
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault.w),
                  child: _taskerTaskController.isFirstLoadRunning.value?const CustomLoader(): Column(
                    children: [
                      Obx(
                        () => Expanded(
                          child:
                           _taskerTaskController.taskerTaskList.isEmpty?
                            Padding(
                              padding: EdgeInsets.only(bottom: 100.h, left: 40.w,right: 40.w),
                              child: const CustomNoDataFound(),
                            ):

                          ListView.builder(
                            controller:_taskerTaskController.scrollController ,
                            itemCount: _taskerTaskController.taskerTaskList.length+1,
                            itemBuilder: (context, index) {
                            if(index < _taskerTaskController.taskerTaskList.length){
                              var taskerTask = _taskerTaskController
                                  .taskerTaskList[index];

                              ///==================date formed================>
                              var date = taskerTask.createdAt;
                              var formatDates = '';
                              if (date != null) {
                                var parsedDate = DateTime.parse(date);
                                formatDates = DateFormat('EEEE dd MMM, yyyy')
                                    .format(parsedDate);
                              } else {
                                formatDates = 'Date is not available';
                              }


                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: 16.h, top: index == 0 ? 16.h : 0),
                                child: GestureDetector(
                                    onTap: () {
                                      print("============sId ${taskerTask.sId}");
                                      Get.toNamed(AppRoutes.taskDetails,
                                          arguments: taskerTask,
                                          parameters: {
                                            "screenType": "taskerTaskScreen",
                                            'tabBarIndex': '${_taskerTaskController.tabBarIndex}',
                                            'sId': "${taskerTask.sId}",
                                          });
                                    },
                                    child: TaskerTaskCard(
                                      faceBookPost: "${taskerTask.name}",
                                      date: formatDates,
                                      taskCompleteAmount:taskerTask.taskId!.price,
                                      //     "${taskerTask?.taskId?.price?.toStringAsFixed(2)}",
                                      // amount: "${taskerTask?.price}",
                                      postLink:
                                      "${taskerTask.taskId?.taskLink}\n",
                                    )),
                              );
                            }else{
                              if(_taskerTaskController.isLoadMoreRunning.value){
                                return const CustomLoader();
                              }else{
                                return const SizedBox();
                              }
                            }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
            }
          }),
        ),
      ),
    );
  }
}

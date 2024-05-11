import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/helpers/time_format.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../../controller/Tasker_controller/tasker_home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class TaskerTaskDetailsScreen extends StatefulWidget {
  const TaskerTaskDetailsScreen({super.key});

  @override
  State<TaskerTaskDetailsScreen> createState() =>
      _TaskerTaskDetailsScreenState();
}

class _TaskerTaskDetailsScreenState extends State<TaskerTaskDetailsScreen> {
  final _taskerHomeController = Get.put(TaskerHomeController());

  Map<String, PreviewData> datas = {};
  var parameters = Get.parameters;

  @override
  Widget build(BuildContext context) {

    var taskDetails = Get.arguments;
    print("======================> ${parameters['tabBarIndex']}");
    return Scaffold(
      //=========================> AppBar Section  <============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.taskDetails,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
          child: Obx(()=>
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //=========================> Task Name <============================
                CustomText(
                  text: AppString.taskName,
                  fontWeight: FontWeight.w500,
                  bottom: 12.h,
                  top: 24.h,
                ),
                //====================> Facebook Post Like Text  <==================
                CustomText(
                  text: "${taskDetails.name} ",
                  fontWeight: FontWeight.w600,
                  bottom: 16.h,
                ),

                //=========================> Task price <============================
                CustomText(
                  text: AppString.taskPrice,
                  fontWeight: FontWeight.w500,
                  bottom: 10.h,
                ),
                //=========================> Task price Rope <=======================
                SelectableText(
                  "R${(taskDetails.price/ 2).toStringAsFixed(2)}" ?? "",
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0FD726)),
                  textAlign: TextAlign.start,
                ),

                ///=====================task link===========================>
                CustomText(
                  text: AppString.taskLink,
                  fontWeight: FontWeight.w500,
                  bottom: 10.h,
                  top: 16.h,
                ),
                //=========================> Task Link Here <=======================
                Container(
                  // key: const ValueKey("https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk"),
                  key: parameters['screenType'] == "taskerTaskScreen"
                      ? ValueKey("${taskDetails.taskLink}")
                      : ValueKey("${taskDetails.taskLink}"),
                  margin: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xfff7f7f8),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: LinkPreview(
                      enableAnimation: true,
                      onPreviewDataFetched: (data) {
                        setState(() {
                          datas = {
                            ...datas,
                            parameters['screenType'] == "taskerTaskScreen"
                                ? "${taskDetails.taskLink}"
                                : "${taskDetails.taskLink}": data,
                            // "https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk":data,
                          };
                        });
                      },
                      // previewData: datas['https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk'],
                      previewData: datas[
                          parameters['screenType'] == "taskerTaskScreen"
                              ? "${taskDetails.taskLink}"
                              : "${taskDetails.taskLink}"],
                      // text:"https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk",
                      text: parameters['screenType'] == "taskerTaskScreen"
                          ? "${taskDetails.taskLink}"
                          : "${taskDetails.taskLink}",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),

                // SelectableText(
                //   "https://www.Facebook.com/Image \nPost",
                //   style: TextStyle(
                //       fontSize: 16.h,
                //       fontWeight: FontWeight.w500,
                //       color: const Color(0xff0FD726)),
                //   textAlign: TextAlign.start,
                // ),
                SizedBox(height: 24.h),
                //=========================> Task Post Text <=======================
                CustomText(
                  text: AppString.taskPost,
                  fontWeight: FontWeight.w500,
                  bottom: 10.h,
                ),
                //========================> Date Text <=============================
                CustomText(
                  text: TimeFormatHelper.formatDate(taskDetails.createdAt!),
                  fontWeight: FontWeight.w600,
                  bottom: 24.h,
                ),


                //=========================> time line <=======================
                if(taskDetails.startDate!=null)
                CustomText(
                  text: AppString.timeLine,
                  fontWeight: FontWeight.w500,
                  bottom: 10.h,
                ),
                //========================> time line <=============================

                if(taskDetails.startDate!=null)
                Container(
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: const Color(0xffB5B5B5))),
                  child: Row(
                    children: [


                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(AppIcons.timeIcon,height: 44.h,width: 44.h,),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    fontsize: 12.h,
                                    text: AppString.startDate,
                                    fontWeight: FontWeight.w500,
                                    bottom: 3.h,
                                  ),
                                  CustomText(
                                    fontsize: 14.h,
                                    text: TimeFormatHelper.dataTimeYearFromat(taskDetails.startDate!),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),



                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(AppIcons.timeIcon,height: 44.h,width: 44.h,),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    fontsize: 12.h,
                                    text: AppString.endDate,
                                    fontWeight: FontWeight.w500,
                                    bottom: 3.h,
                                  ),
                                  CustomText(
                                    fontsize: 14.h,
                                    text: TimeFormatHelper.dataTimeYearFromat(taskDetails.endDate!),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),

                //=========================> Submit Task Button <===================
                parameters['tabBarIndex'] == '0'
                    ? CustomButton(
                        title: AppString.submitTask,
                        onpress: () {
                          Get.toNamed(AppRoutes.submitTaskScreen,
                              parameters: {'sId': "${parameters['sId']}"});
                        })
                    : parameters['screenType'] == "taskerTaskScreen"
                        ? const SizedBox()
                        : _taskerHomeController.alreadyTaskRegister
                                .contains(taskDetails.id)
                            ? CustomButton(
                                title: AppString.submitTask,
                                onpress: () {

                              var index=    _taskerHomeController.alreadyTaskRegister.indexOf(taskDetails.id);


                                  Get.toNamed(AppRoutes.submitTaskScreen,
                                      parameters: {'sId':   _taskerHomeController.registerTaskIdList[index]});
                                })
                            : Obx(
                                () => CustomButton(
                                    loading: _taskerHomeController.loading.value,
                                    title: AppString.taskRegisterNow,
                                    onpress: () {
                                      _taskerHomeController.taskRegister(
                                          "${taskDetails.name}",
                                          "${taskDetails.id}",
                                          "${taskDetails.price}");
                                    }),
                              ),
                SizedBox(height: 54.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/helpers/time_format.dart';
import 'package:spotlyt_task/models/tasker_models/tasker_home_model.dart';
import 'package:spotlyt_task/models/tasker_task_model.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../../controller/Tasker_controller/tasker_home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() =>
      _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final _taskerHomeController = Get.put(TaskerHomeController());

  Map<String, PreviewData> datas = {};
  var parameters = Get.parameters;

  @override
  Widget build(BuildContext context) {
    Tasks taskDetails = Get.arguments;
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
          child: Column(
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
                text: "${taskDetails?.name}",
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
                "R-${(taskDetails.price!/2).toStringAsFixed(2)}" ?? "",

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
                    ? ValueKey("${taskDetails.taskId!.taskLink}")
                    : ValueKey("${taskDetails.taskId!.taskLink}"),
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
                              ? "${taskDetails.taskId!.taskLink}"
                              : "${taskDetails.taskId!.taskLink}": data,
                          // "https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk":data,
                        };
                      });
                    },
                    // previewData: datas['https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk'],
                    previewData: datas[
                    parameters['screenType'] == "taskerTaskScreen"
                        ? "${taskDetails.taskId!.taskLink}"
                        : "${taskDetails.taskId!.taskLink}"],
                    // text:"https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk",
                    text: parameters['screenType'] == "taskerTaskScreen"
                        ? "${taskDetails.taskId!.taskLink}"
                        : "${taskDetails.taskId!.taskLink}",
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
                text: TimeFormatHelper.formatDate(DateTime.parse(taskDetails.taskId!.createdAt!)),
                fontWeight: FontWeight.w600,
                bottom: 16.h,
              ),


              //=========================> time line <=======================
              if(taskDetails.taskId!.startDate!=null )
                CustomText(
                  text: AppString.timeLine,
                  fontWeight: FontWeight.w500,
                  bottom: 10.h,
                ),
              //========================> time line <=============================

              if(taskDetails.taskId!.startDate != null )

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
                                    text: TimeFormatHelper.dataTimeYearFromat(taskDetails.taskId!.startDate!),
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
                                    text: TimeFormatHelper.dataTimeYearFromat(taskDetails.taskId!.endDate!),
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
                  : CustomButton(
                  title: AppString.taskRegisterNow,
                  onpress: () {
                    _taskerHomeController.taskRegister(
                        "${taskDetails.name}",
                        "${taskDetails.taskId!.sId}",
                        "${taskDetails.price}");
                  }),
              SizedBox(height: 54.h)
            ],
          ),
        ),
      ),
    );
  }
}

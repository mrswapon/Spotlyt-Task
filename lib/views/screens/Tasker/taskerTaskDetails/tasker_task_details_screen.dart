import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;

class TaskerTaskDetailsScreen extends StatefulWidget {
  const TaskerTaskDetailsScreen({super.key});

  @override
  State<TaskerTaskDetailsScreen> createState() => _TaskerTaskDetailsScreenState();
}

class _TaskerTaskDetailsScreenState extends State<TaskerTaskDetailsScreen> {

  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=========================> AppBar Section  <============================
      appBar: AppBar(
        title: CustomText(
          text: AppString.taskDetails,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),

      body: Padding(
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
              text: "Facebook Post Like",
              fontWeight: FontWeight.w600,
              bottom: 16.h,
            ),


            //=========================> Task price <============================
            CustomText(
              text: AppString.taskPrice,
              fontWeight: FontWeight.w500,
              bottom: 10.h,
            ),
            //=========================> Task price Ropi <=======================
            SelectableText(
              "R 0.30",
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
          key: const ValueKey("https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk"),
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
                    "https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk":data,
                  };
                });
              },
              previewData: datas['https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk'],
              text:"https://www.facebook.com/share/p/9vicnX8ujrEJDGyY/?mibextid=oFDknk",
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
              text: "Friday 01 Feb, 2024",
              fontWeight: FontWeight.w600,
              bottom: 24.h,
            ),
            //SizedBox(height: 24.h),
            const Spacer(),
            //=========================> Submit Task Button <===================
            CustomButton(
                title: AppString.submitTask,
                onpress: () {
                    Get.toNamed(AppRoutes.submitTaskScreen);
                }),
            SizedBox(height: 54.h)
          ],
        ),
      ),
    );
  }
}

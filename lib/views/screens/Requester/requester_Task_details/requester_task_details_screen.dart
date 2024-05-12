import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/helpers/time_format.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' show PreviewData;
import 'package:flutter_link_previewer/flutter_link_previewer.dart';

class RequesterTaskDetailsScreen extends StatefulWidget {
  RequesterTaskDetailsScreen({super.key});

  @override
  State<RequesterTaskDetailsScreen> createState() =>
      _RequesterTaskDetailsScreenState();
}

class _RequesterTaskDetailsScreenState
    extends State<RequesterTaskDetailsScreen> {
  Map<String, PreviewData> datas = {};
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      ///----------------------------app bar section---------------------------->
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///-----------------------------task name----------------------->
              CustomText(
                text: AppString.taskName,
                fontWeight: FontWeight.w500,
                bottom: 16.h,
                top: 24.h,
              ),
          
              ///---------------------------facebook post like text------------------------->
              CustomText(
                text: data.name,
                fontWeight: FontWeight.w500,
                bottom: 24.h,
              ),
          
              ///--------------------------quantity------------------------->
              CustomText(
                text: "Quantity : ${data.count}",
                fontWeight: FontWeight.w500,
                bottom: 16.h,
              ),

             ///--------------------------task link------------------------->
              CustomText(
                text: AppString.taskLink,
                fontWeight: FontWeight.w500,
                bottom: 16.h,
              ),

              ///--------------------------link text---------------------------->
              Container(
                key: ValueKey("${data.taskLink}"),
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
                    onPreviewDataFetched: (datass) {
                      setState(() {
                        datas = {
                          ...datas,
                          "${data.taskLink}": datass,
                        };
                      });
                    },
                    previewData: datas["${data.taskLink}"],
                    text: "${data.taskLink}",
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
          
              SizedBox(height: 24.h),
          
              ///---------------------------------task post text-------------------------->
              CustomText(
                text: AppString.taskPost,
                fontWeight: FontWeight.w500,
                bottom: 16.h,
              ),
          
              ///----------------------------------date text----------------------->
              CustomText(
                text: TimeFormatHelper.formatDate(data.createdAt),
                fontWeight: FontWeight.w500,
                bottom: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

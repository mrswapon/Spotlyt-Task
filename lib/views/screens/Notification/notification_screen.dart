import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/notifications_controller/notifications_controller.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimentions.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationsController _notificationsController =
      Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------------app bar section-------------------------->
      appBar: AppBar(
        title: CustomText(
          textAlign: TextAlign.start,
          text: "Notifications",
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),

      ///-----------------------------------body section-------------------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15),
        child: Obx(() {
          return _notificationsController.notificationsLoading.value
              ? const CustomLoader()
              : Column(
                  children: [
                    ///-----------------------notification------------------------>

                    Expanded(
                      child: ListView.builder(
                        itemCount: _notificationsController.notificationsModel
                            .value.data?.attributes?.results?.length,
                        itemBuilder: (context, index) {
                          var notifications = _notificationsController
                              .notificationsModel
                              .value
                              .data
                              ?.attributes
                              ?.results![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Notification(
                              message: notifications?.message,
                              time: notifications!.createdAt,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
        }),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  final String? message;
  final DateTime? time;

  const Notification({super.key, this.message, this.time});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w, right: 7.w),
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: SvgPicture.asset(
                  AppIcons.bellIcon,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$message",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.fontSizeLarge.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    top: 2.h,
                    text: timeago.format(time!),
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff767676),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

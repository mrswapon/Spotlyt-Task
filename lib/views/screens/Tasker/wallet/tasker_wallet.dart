import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/controller/Tasker_controller/wallet_controller.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../../utils/app_icons.dart';

class TaskerWalletScreen extends StatelessWidget {
  TaskerWalletScreen({super.key});

  final WalletController _walletController = Get.put(WalletController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    _walletController.walletModel;
    var walletLength =
        _walletController.walletModel.value.data?.attributes?.length ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.wallet,
          fontWeight: FontWeight.w500,
          fontsize: 18.sp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20.h,
          ),

          ///============================total balance card==================================>
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.fillColorGreenA0,
                border: Border.all(color: AppColors.primaryColor, width: 2.sp)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 51.h),
              child: Column(
                children: [
                  CustomText(text: AppString.totalBalance, fontsize: 24.h),
                  CustomText(
                      text: "R ${_profileController.profileModel.value.rand}",
                      fontsize: 30.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                ],
              ),
            ),
          ),
          //========================> Minimum And Maximum Withdrawal Balance <========================
          SizedBox(
            height: 24.h,
          ),
          CustomText(
              text: AppString.minimumWithdrawal,
              fontsize: 14.h,
              color: Colors.black),
          SizedBox(height: 12.h),
          CustomText(
              text: AppString.maximumWithdrawal,
              fontsize: 14.h,
              color: Colors.black),
          SizedBox(height: 24.h),
          //==========================> Last Withdrawal Row Button <============================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: AppString.lastWithdrawal,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              //======================> See All History Button <==========================
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.withdrawalHistory);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                          color: AppColors.primaryColor, width: 1.sp)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.3.w),
                    child: CustomText(
                      text: AppString.seeAllHistory,
                      fontsize: 12.h,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //======================> List View Item Section <======================
          Obx(
            () => _walletController.walletLoading.value
                ? const CustomLoader()
                : Expanded(
                    child: ListView.builder(
                      itemCount: (_walletController.walletModel.value.data?.attributes?.length ?? 0) <= 3
                          ? _walletController
                              .walletModel.value.data?.attributes?.length
                          : _walletController.walletModel.value.data?.attributes
                              ?.sublist(0, 3)
                              .length,
                      itemBuilder: (context, index) {
                        var walletData = _walletController
                            .walletModel.value.data?.attributes![index];
                        var date = walletData?.createdAt;
                        var formatDate = '';
                        if (date != null) {
                          formatDate =
                              DateFormat('EEEE dd MMM, yyyy').format(date);
                        } else {
                          null;
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.withDrawIcon,
                                width: 48.w,
                                height: 48.h,
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: AppString.withDrawal,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 6.h),
                                  CustomText(
                                    text: formatDate,
                                    fontWeight: FontWeight.w500,
                                    fontsize: 12.h,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ///==============================withdrawal Amount ======================>
                                  CustomText(
                                    text: '-\$${walletData?.withdrawalAmount}',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 6.h),

                                  ///============================Status ===============================>
                                  CustomText(
                                    text: '${walletData?.status}',
                                    fontWeight: FontWeight.w500,
                                    fontsize: 12.h,
                                    color: walletData?.status == "Pending"
                                        ? Colors.red
                                        : walletData?.status == "Completed"
                                            ? AppColors.primaryColor
                                            : Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ),
          //========================> Request for withdraw Button <=================
          CustomButton(
              title: AppString.requestForWithdraw,
              onpress: () {
                Get.toNamed(AppRoutes.withdrawBalanceScreen);
              }),
          SizedBox(height: 15.h)
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import '../../../../controller/Tasker_controller/wallet_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class WithdrawalHistory extends StatelessWidget {
   WithdrawalHistory({super.key});

  final WalletController _walletController = Get.put(WalletController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.withdrawalHistory,
          fontWeight: FontWeight.w500,
          fontsize: 18.sp,
        ),
      ),
      body: Obx(()=> Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              //======================> List View Item Section <======================
              Expanded(
                child: _walletController.walletModel.value.data!.attributes!.isEmpty ?  Center(child: CustomText(text: "No data found",),) : ListView.builder(
                  itemCount: _walletController.walletModel.value.data?.attributes?.length,
                  itemBuilder: (context, index) {
                    var walletData = _walletController.walletModel.value.data?.attributes![index];
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
                              CustomText(
                                text: '-\$${walletData?.withdrawalAmount}',
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                              SizedBox(height: 6.h),
                              CustomText(
                                text: "${walletData?.status}",
                                fontWeight: FontWeight.w500,
                                fontsize: 12.h,
                                color: walletData?.status == "Pending" ? Colors.red : walletData?.status == "Completed" ? AppColors.primaryColor : Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

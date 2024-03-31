import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_text.dart';

class WithdrawalHistory extends StatelessWidget {
  const WithdrawalHistory({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            //======================> List View Item Section <======================
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
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
                              text: '2024 Jan 16',
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
                              text: '-\$120',
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                            SizedBox(height: 6.h),
                            CustomText(
                              text: 'Pending',
                              fontWeight: FontWeight.w500,
                              fontsize: 12.h,
                              color: Colors.red,
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
    );
  }
}

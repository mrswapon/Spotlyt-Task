import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class WithdrawBalanceScreen extends StatelessWidget {
  WithdrawBalanceScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountTypeController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.withdrawalBalance,
          fontWeight: FontWeight.w500,
          fontsize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    CustomText(
                      maxline: 2,
                      textAlign: TextAlign.start,
                      text: AppString.pleaseProvide,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    SizedBox(height: 24.h),
                    //===============================> Bank Name Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 16.h,
                      controller: _bankNameController,
                      hintText: AppString.bankName,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter bank name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    //===============================> Account Type Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 16.h,
                      controller: _accountTypeController,
                      hintText: AppString.accountType,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter account type email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    //===============================> Account Number Text-field <===============================
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 16.h,
                      controller: _accountNumberController,
                      hintText: AppString.accountNumber,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter account number";
                        }
                        return null;
                      },
                    ),
                    //===============================> Withdrawal Amount Text-field <===============================
                    SizedBox(height: 16.h),
                    CustomTextField(
                      contenpaddingHorizontal: 16.w,
                      contenpaddingVertical: 16.h,
                      controller: _amountController,
                      hintText: AppString.withdrawalAmount,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter withdrawal amount";
                        }
                        return null;
                      },
                    ),

                    //===============================> Withdraw Button <===============================
                    SizedBox(height: 292.h),
                    CustomButton(
                        title: AppString.withdraw,
                        onpress: () {
                          //if (_formKey.currentState!.validate()) {
                          Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                          // }
                        }),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

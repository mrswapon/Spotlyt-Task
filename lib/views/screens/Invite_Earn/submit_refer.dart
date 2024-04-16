import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/Invite_Earn/InnerWidgets/invite_earn_controller.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';

class SubmitReferCodeScreen extends StatelessWidget {
  SubmitReferCodeScreen({super.key});


  final InviteAndEernController _inviteAndErenController = Get.put(InviteAndEernController());
  final ProfileController _profileController = Get.put(ProfileController());

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      ///---------------------------------app bar------------------------------>
      appBar: AppBar(
        // title: CustomText(
        //   text: AppString.inviteAndEarn,
        //   fontsize: 18.h,
        //   fontWeight: FontWeight.w500,
        // ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 34.h,
            ),

            ///---------------------------top image------------------------------->
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.earnImage,
                  width: 260.w,
                  height: 250.h,
                  fit: BoxFit.fill,
                )),

            ///-----------------------------invite your friends and get rand text-------------------->
            CustomText(
              text: AppString.referralCode,
              fontsize: 24.h,
              fontWeight: FontWeight.w500,
              top: 34.h,
              bottom: 16.h,
            ),

            ///--------------------------share the link below or ask text--------------------------->
            CustomText(
              text: AppString.referralSubmitDes,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: PinCodeTextField(
                validator: (v){
                  if(v!.isEmpty){
                    return "Type your referral code";
                  }else if(v.length<6){
                    return "Type your referral code";
                  }
                  return null;
                },
                controller:  _inviteAndErenController.referCodeCtrl,
                autoDisposeControllers: false,
                backgroundColor: Colors.transparent,
                cursorColor: AppColors.primaryColor,
                textStyle: const TextStyle(color: Colors.black),
                autoFocus: false,
                appContext: context,
                length: 6,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    selectedColor: AppColors.primaryColor,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.grey,
                    activeColor: AppColors.primaryColor),
                //obscureText: false,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print("----value: $value");
                },
              ),
            ),



            ///----------------------------copy link card--------------------------->


            const Spacer(),
            ///--------------------------invite friends botton------------------------------><
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(()=>
                 CustomButton(title: "Submit",
                     loading: _inviteAndErenController.loading.value,
                     onpress: () {
                if(_formKey.currentState!.validate()){
                  if(_profileController.profileModel.value.referralCode != _inviteAndErenController.referCodeCtrl.text){
                    _inviteAndErenController.submit(_inviteAndErenController.referCodeCtrl.text.trim());
                  }
                }

                }),
              ),
            ),

            SizedBox(
              height: 44.h,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Profile_Controller/profile_controller.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/Invite_Earn/InnerWidgets/invite_earn_controller.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../widgets/custom_text.dart';

class InviteEarnScreen extends StatelessWidget {
   InviteEarnScreen({super.key});

  // final InviteAndEernController _inviteAndEernController = Get.put(InviteAndEernController());
  final ProfileController _profileController = Get.put(ProfileController());


   void _copyToClipboard(BuildContext context) {
     Clipboard.setData(ClipboardData(text: _profileController.profileModel.value.referralCode!));
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Code copied to clipboard')),
     );
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      ///---------------------------------app bar------------------------------>
      appBar: AppBar(
        title: CustomText(
          text: AppString.inviteAndEarn,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(()=>
         Column(
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
              text: AppString.inviteYourFriendsAndGetRand,
              fontsize: 24.h,
              fontWeight: FontWeight.w500,
              top: 34.h,
              bottom: 16.h,
            ),

            ///--------------------------share the link below or ask text--------------------------->
            CustomText(
              text: AppString.shareTheLinkBeloworAsk,
            ),




            ///----------------------------copy link card--------------------------->
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Center(
                child: DottedBorder(
                  padding: const EdgeInsets.all(0),
                  dashPattern: const [12,5],
                  color: Colors.green,
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(8.r),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffBFD8BF),
                        borderRadius: BorderRadius.circular(8.r)
                    ),
                    width: double.infinity,
                    height: 56.h,
                    child:  Obx(() {
                   _profileController.profileModel.value;
                     return  Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                               SelectableText(
                                '${_profileController.profileModel.value.referralCode}',
                                 style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.w600, color: AppColors.primaryColor),
                              ),
                              // CustomText(
                              //   // text: "Link",
                              //   text: "${_inviteAndEernController.referrals}",
                              //   fontsize: 18.h,
                              //   fontWeight: FontWeight.w600,
                              //   color: AppColors.primaryColor,
                              // ),
                              GestureDetector(
                                onTap: (){
                                  _copyToClipboard(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.copy,
                                      color: AppColors.primaryColor,
                                    ),
                                    CustomText(
                                      text: "Copy Code",
                                      fontsize: 14.h,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryColor,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );}
                    ),
                  ),
                ),
              ),
            ),
            if(_profileController.profileModel.value.claimedReferralCode!.isEmpty)
            const Spacer(),
            ///--------------------------invite friends botton------------------------------><
            if(_profileController.profileModel.value.claimedReferralCode!.isEmpty)
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButton(title: "Use Refer Code", onpress: () {
               Get.toNamed(AppRoutes.submitReferCode);
              }),
            ),
            if(_profileController.profileModel.value.claimedReferralCode!.isEmpty)
            SizedBox(
              height: 44.h,
            )
          ],
        ),
      ),
    );
  }
}

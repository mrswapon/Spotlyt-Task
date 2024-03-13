import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import 'inner_widgets/requester_cetegories_and_services_card.dart';
import 'inner_widgets/requester_home_screen_app_bar.dart';

class RequesterHomeScreen extends StatelessWidget {
  const RequesterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault.w),
            child: Column(
              children: [
                ///---------------------------------app bar section------------------------------>
                SizedBox(
                  height: 50.h,
                ),
                RequesterHomeScreenAppBar(),

                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault.w),
                child: Column(

                  children: [
                    SizedBox(height: 16.h,),
                    ///-------------------------------social media card--------------------------->
                    CetegoriesAndServicesCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.servicesScreen);
                      },
                      title: "Social Media",
                      servicesInfo: const [
                        "  • REQUEST LIKES",
                        "  • REQUEST FOLLOWERS",
                        "  • REQUEST COMMENTS",
                        "  • REQUEST VIEWS",
                        "  • REQUEST SHARING TO STORY",
                      ],
                      categories: const [
                        {
                          "buttonName": "Facebook",
                          "icon": AppIcons.facebook,
                        },
                        {
                          "buttonName": "Instagram",
                          "icon": AppIcons.instagram,
                        },
                        {
                          "buttonName": "Tiktok",
                          "icon": AppIcons.tiktok,
                        },
                      ],
                    ),
            
                    SizedBox(
                      height: 16.h,
                    ),
            
                    ///-------------------------------Video card--------------------------->
                    CetegoriesAndServicesCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.videoServicesScreen);
                      },
                      title: "Video",
                      servicesInfo: const [
                        "  • REQUEST VIEWS",
                        "  • REQUEST LIKES",
                        "  • REQUEST COMMENTS",
                        "  • REQUEST SUBSCRIBERS",
                      ],
                      categories: const [
                        {
                          "buttonName": "Youtube",
                          "icon": AppIcons.youtube,
                        },
                      ],
                    ),
            
                    SizedBox(
                      height: 16.h,
                    ),
            
                    ///-------------------------------Corporate card--------------------------->
                    CetegoriesAndServicesCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.corporateServicesScreen);
                      },
                      title: "Corporate",
                      servicesInfo: const [
                        "  • SIGN UP TO SERVICES",
                        "  • APP DOWNLOADS",
                        "  • GAME DOWNLOADS",
                        "  • REQUEST STREAMING",
                      ],
                      categories: const [
                        {
                          "buttonName": "Corporate",
                          "icon": AppIcons.corporateIcon,
                        },
                      ],
                    ),


                    SizedBox(height: 113.h,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import '../../../utils/app_icons.dart';
import 'inner_widgets/cetegories_and_services_card.dart';
import 'inner_widgets/home_screen_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
            child: Column(
              children: [
                ///---------------------------------app bar section------------------------------>
                SizedBox(
                  height: 8.h,
                ),
                HomeScreenAppBar(),
          
          
                SizedBox(height: 28.h,),
                 ///-------------------------------social media card--------------------------->
                 CetegoriesAndServicesCard(
                   title:  "Social Media",
                   servicesInfo: const [
                     "  • REQUEST LIKES","  • REQUEST FOLLOWERS","  • REQUEST COMMENTS","  • REQUEST VIEWS","  • REQUEST SHARING TO STORY",
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
          
          
          
          
          
          
                SizedBox(height: 16.h,),
                ///-------------------------------Video card--------------------------->
                CetegoriesAndServicesCard(
                  title:  "Video",
                  servicesInfo: const [
                    "  • REQUEST VIEWS","  • REQUEST LIKES","  • REQUEST COMMENTS","  • REQUEST SUBSCRIBERS",
                  ],
          
          
                  categories: const [
                    {
                      "buttonName": "Youtube",
                      "icon": AppIcons.youtube,
                    },
                  ],
                ),
          
          
          
          
          
          
          
          
                SizedBox(height: 16.h,),
                ///-------------------------------Corporate card--------------------------->
                CetegoriesAndServicesCard(
                  title:  "Corporate",
                  servicesInfo: const [
                    "  • SIGN UP TO SERVICES","  • APP DOWNLOADS","  • GAME DOWNLOADS","  • REQUEST STREAMING",
                  ],
          
          
                  categories: const [
                    {
                      "buttonName": "Corporate",
                      "icon": AppIcons.corporateIcon,
                    },
                  ],
                ),
          
          
              ],
            ),
          ),
        ),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import 'controller/requester_home_controller.dart';
import 'inner_widgets/requester_cetegories_and_services_card.dart';
import 'inner_widgets/requester_home_screen_app_bar.dart';

class RequesterHomeScreen extends StatefulWidget {

  @override
  State<RequesterHomeScreen> createState() => _RequesterHomeScreenState();
}

class _RequesterHomeScreenState extends State<RequesterHomeScreen> {
 RequesterHomeController requesterHomeController = Get.put(RequesterHomeController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requesterHomeController.requesterTaskService() ;
  }

  // RequesterHomeScreen(){
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Obx(() => requesterHomeController.isLoading.value ?
      const Center(child: CircularProgressIndicator()) :
      Column(
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
                      title: requesterHomeController.homeScreenModel?.data?.attributes?[0].name,
                      servicesInfo:requesterHomeController.homeScreenModel?.data?.attributes?[0].description,
                      categories:  [
                        {
                          "buttonName": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[0].name,
                          "icon": AppIcons.facebook,
                        },
                        {
                          "buttonName": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[1].name,
                          "icon": AppIcons.instagram,
                        },
                        {
                          "buttonName": requesterHomeController.homeScreenModel?.data?.attributes?[0].categories?[2].name,
                          "icon": AppIcons.tiktok,
                        },
                      ],
                    ),

                    SizedBox(height: 16.h),

                    ///-------------------------------Video card--------------------------->
                    CetegoriesAndServicesCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.videoServicesScreen);
                      },
                      title: requesterHomeController.homeScreenModel?.data?.attributes?[1].name,
                      servicesInfo: requesterHomeController.homeScreenModel?.data?.attributes?[1].description,
                      categories:[
                        {
                          "buttonName": requesterHomeController.homeScreenModel?.data?.attributes?[1].categories?[0].name,
                          "icon": AppIcons.youtube,
                        },
                      ],
                    ),

                    SizedBox(height: 16.h),

                    ///-------------------------------Corporate card--------------------------->
                    CetegoriesAndServicesCard(
                      ontap: (){
                        Get.toNamed(AppRoutes.corporateServicesScreen);
                      },
                      title: requesterHomeController.homeScreenModel?.data?.attributes?[2].name,
                      servicesInfo: requesterHomeController.homeScreenModel?.data?.attributes?[2].description,
                      categories: [
                        {
                          "buttonName": requesterHomeController.homeScreenModel?.data?.attributes?[2].categories?[0].name,
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
      )),
    );
  }
}

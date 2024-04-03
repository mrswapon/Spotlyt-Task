import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_loader.dart';
import '../../../../controller/requesterController/requester_home_controller.dart';
import 'inner_widgets/requester_cetegories_and_services_card.dart';
import 'inner_widgets/requester_home_screen_app_bar.dart';

class RequesterHomeScreen extends StatefulWidget {
  const RequesterHomeScreen({super.key});

  @override
  State<RequesterHomeScreen> createState() => _RequesterHomeScreenState();
}

class _RequesterHomeScreenState extends State<RequesterHomeScreen> {
  final RequesterHomeController _requesterHomeController =
      Get.put(RequesterHomeController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _requesterHomeController.isLoading.value
          ? const Center(child: CustomLoader())
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault.w),
                  child: Column(
                    children: [
                      ///---------------------------------app bar section------------------------------>
                      SizedBox(height: 50.h),
                      RequesterHomeScreenAppBar(),
                      SizedBox(height: 18.h),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault.w),
                    itemCount: _requesterHomeController
                        .homeScreenModel!.data!.attributes!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var serviceData = _requesterHomeController
                          .homeScreenModel?.data?.attributes?[index];
                      debugPrint('=====data>   ${serviceData!.name}');
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: CetegoriesAndServicesCard(
                          ontap: () {
                            Get.toNamed(AppRoutes.servicesScreen,
                                arguments: serviceData);
                          },
                          title: serviceData.name,
                          servicesInfo: serviceData.description,
                          categories: serviceData.categories ?? [],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 67.h)
              ],
            )),
    );
  }
}

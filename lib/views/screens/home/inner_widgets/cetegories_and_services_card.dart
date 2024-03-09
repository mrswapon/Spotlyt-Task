
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import 'cetegory_botton.dart';
import '../../../widgets/custom_text.dart';

class CetegoriesAndServicesCard extends StatelessWidget {
   VoidCallback? ontap;
  final String? title;
  final List? servicesInfo;
  final List categories;



  CetegoriesAndServicesCard({this.title, this.servicesInfo, required this.categories, this.ontap});






  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      width: 345.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        height: 400,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.cardBgImage), fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            ///-----------------------------top titile---------------------------------------->
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: Center(
                  child: CustomText(
                    text: "$title",
                    top: 10.h,
                    bottom: 10.h,
                    color: Colors.white,
                    fontsize: 14.h,
                  )),
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///------------------------------------categories text---------------------------->
                  CustomText(
                    text: "Categories:",
                    fontsize: 14.h,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    top: 10.h,
                    bottom: 8.h,
                  ),


                  ///-----------------------------cetegory botton-------------------------->
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    categories.map((category) {
                      return CetegoryBotton(
                        icon: category["icon"],
                        name: category["buttonName"],
                      );
                    }).toList(),
                  ),


                  ///------------------------------------Services: text---------------------------->
                  CustomText(
                    text: "Services:",
                    fontsize: 14.h,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    top: 10.h,
                    bottom: 10.h,
                  ),

                  

                  ///------------------------cetegory list view builder------------------------->
                  SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: servicesInfo!.length,
                      itemBuilder: (context, index) {
                        var info = servicesInfo![index];
                        return
                        CustomText(
                          textAlign: TextAlign.start,
                          text: "$info",
                          fontsize: 10.h,
                          bottom: 8.h,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),


            const Spacer(),


            ///-------------------------------------request for serviecs botton-------------------------------------->
            Padding(
              padding:  EdgeInsets.only(bottom: 15.h, right: 15.w, left: 15.w),
              child: GestureDetector(

                ///-------------------ontap ------------->
                onTap: ontap,

                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Center(
                      child: CustomText(
                        text: AppString.requestForServices,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        bottom: 12.h,
                        top: 12.h,
                      )),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


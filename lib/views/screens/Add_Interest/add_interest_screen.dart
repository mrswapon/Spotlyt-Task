import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/app_strings.dart';

class AddInterestScreen extends StatefulWidget {
  AddInterestScreen({super.key});

  @override
  State<AddInterestScreen> createState() => _AddInterestScreenState();
}

class _AddInterestScreenState extends State<AddInterestScreen> {
  List items = [
    {
      "icon": "${AppIcons.music}",
      "title": "Music",
    },
    {
      "icon": "${AppIcons.fitness}",
      "title": "Fitness",
    },
    {
      "icon": "${AppIcons.food}",
      "title": "Food",
    },
    {
      "icon": "${AppIcons.tech}",
      "title": "Tech",
    },
    {
      "icon": "${AppIcons.fashion}",
      "title": "Fashion",
    },
    {
      "icon": "${AppIcons.travel}",
      "title": "Travel",
    },
    {
      "icon": "${AppIcons.homess}",
      "title": "Outdoor",
    },
    {
      "icon": "${AppIcons.dIY}",
      "title": "DIY",
    },
    {
      "icon": "${AppIcons.homess}",
      "title": "Houses",
    },
    {
      "icon": "${AppIcons.pet}",
      "title": "Pets",
    },
    {
      "icon": "${AppIcons.movies}",
      "title": "Movies",
    },
    {
      "icon": "${AppIcons.art}",
      "title": "Art",
    },
    {
      "icon": "${AppIcons.career}",
      "title": "Career",
    },
    {
      "icon": "${AppIcons.sports}",
      "title": "Sports",
    },
    {
      "icon": "${AppIcons.book}",
      "title": "Books",
    },
    {
      "icon": "${AppIcons.car}",
      "title": "Cars",
    },
    {
      "icon": "${AppIcons.games}",
      "title": "Games",
    },
    {
      "icon": "${AppIcons.shooping}",
      "title": "Shopping",
    },
    {
      "icon": "${AppIcons.finance}",
      "title": "Finance",
    },
    {
      "icon": "${AppIcons.investing}",
      "title": "Investing",
    }
  ];

  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.addInterest,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [
            ///-------------------------------select your interest text---------------------------------->
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: AppString.selectYourInterest,
                fontsize: 18.h,
                fontWeight: FontWeight.w500,
                top: 24.h,
                bottom: 16.h,
              ),
            ),

            Expanded(
              child: ListView.builder(
                ///------------------------total items and 4 items a row----------------------------->
                itemCount: (items.length / 4).ceil(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ///------------------------4 items a row and when complete 4 items then create new row---------------------------->
                      children: List.generate(4, (i) {
                        final itemsIndex = index * 4 + i;
                        print("-------------$itemsIndex--------------$i");

                        if (itemsIndex < items.length) {
                          return GestureDetector(
                            onTap: () {
                              ///------------------------on tap-------------------------------->
                              setState(() {
                                final item = items[itemsIndex]["title"];

                                ///---------------------selected list initially empty --------------->
                                ///-------------------if selectedItems have item do remove from this list and if selectedItems don't have item do add ---------------->
                                if (selectedItems.contains(item)) {
                                  selectedItems.remove(item);
                                } else {
                                  selectedItems.add(item);
                                }
                              });
                            },

                            ///--------------------------------items Container------------------------------------->
                            child: Container(
                              decoration: BoxDecoration(

                                  ///--------------------------------Botton color------------------------------->
                                  color: selectedItems
                                          .contains(items[itemsIndex]["title"])
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  border: Border.all(
                                    ///----------------------------------border color---------------------------->
                                    color: AppColors.primaryColor,
                                  )),
                              child: Row(
                                children: [

                                  ///--------------------------icon------------------------->
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 6.w, right: 3.w),
                                    child: SvgPicture.asset(
                                      "${items[itemsIndex]["icon"]}",
                                      color: selectedItems.contains(
                                              items[itemsIndex]["title"])
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                    ),
                                  ),

                                  ///----------------------------------title name------------------------------------->
                                  CustomText(
                                    text: "${items[itemsIndex]["title"]}",
                                    fontsize: 11.5.h,
                                    top: 7.h,
                                    bottom: 7.h,
                                    right: 11.w,
                                    color: selectedItems.contains(
                                            items[itemsIndex]["title"])
                                        ? Colors.white
                                        : AppColors.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                    ),
                  );
                },
              ),
            ),

            CustomButton(
                title: "Continue",
                onpress: () {
                  Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                }),

            SizedBox(height: 44.h)
          ],
        ),
      ),
    );
  }
}

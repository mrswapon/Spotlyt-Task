import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/controller/Tasker_controller/add_interest_controller.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/services/api_constants.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_loader.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';
import '../../../utils/app_strings.dart';

class AddInterestScreen extends StatefulWidget {
  AddInterestScreen({super.key});

  @override
  State<AddInterestScreen> createState() => _AddInterestScreenState();
}

class _AddInterestScreenState extends State<AddInterestScreen> {
  final AddInterestController _controller = Get.put(AddInterestController());

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
      body: Obx(
        () => _controller.loading.value
            ? const CustomLoader()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault.w),
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
                        itemCount: (_controller.interestList.length / 4).ceil(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              ///------------------------4 items a row and when complete 4 items then create new row---------------------------->
                              children: List.generate(4, (i) {
                                final itemsIndex = index * 4 + i;
                                print(
                                    "-------------$itemsIndex--------------$i");

                                if (itemsIndex <
                                    _controller.interestList.length) {
                                  return GestureDetector(
                                    onTap: () {
                                      ///------------------------on tap-------------------------------->
                                      setState(() {
                                        final item = _controller
                                            .interestList[itemsIndex];

                                        ///---------------------selected list initially empty --------------->
                                        ///-------------------if selectedItems have item do remove from this list and if selectedItems don't have item do add ---------------->
                                        if (_controller.selectInterestList
                                            .contains(item)) {
                                          _controller.selectInterestList
                                              .remove(item);
                                        } else {
                                          _controller.selectInterestList
                                              .add(item);
                                        }
                                      });
                                    },

                                    ///--------------------------------items Container------------------------------------->
                                    child: Container(
                                      decoration: BoxDecoration(

                                          ///--------------------------------Botton color------------------------------->
                                          color: _controller.selectInterestList
                                                  .contains(_controller
                                                      .interestList[itemsIndex])
                                              ? AppColors.primaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          border: Border.all(
                                            ///----------------------------------border color---------------------------->
                                            color: AppColors.primaryColor,
                                          )),
                                      child: Row(
                                        children: [
                                          ///--------------------------icon------------------------->
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 6.w, right: 3.w),
                                            child: SvgPicture.network(
                                              "${ApiConstants.imageBaseUrl}${_controller.interestList[itemsIndex].icon}",
                                              color: _controller
                                                      .selectInterestList
                                                      .contains(_controller
                                                              .interestList[
                                                          itemsIndex])
                                                  ? Colors.white
                                                  : AppColors.primaryColor,
                                            ),
                                          ),

                                          ///----------------------------------title name------------------------------------->
                                          CustomText(
                                            text:
                                                "${_controller.interestList[itemsIndex].title}",
                                            fontsize: 11.5.h,
                                            top: 7.h,
                                            bottom: 7.h,
                                            right: 11.w,
                                            color: _controller
                                                    .selectInterestList
                                                    .contains(_controller
                                                            .interestList[
                                                        itemsIndex])
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
                          _controller.addInterestsList();
                          // Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                        }),

                    SizedBox(height: 44.h)
                  ],
                ),
              ),
      ),
    );
  }
}

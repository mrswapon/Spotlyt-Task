import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotlyt_task/models/requester_home_screen_model.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import 'custom_text.dart';

class CustomMultiSelectRequestCard extends StatefulWidget {
  List<Service> requestList;
  final Function(int index) onTap;
  int initSelect;

  CustomMultiSelectRequestCard(
      {super.key, required this.requestList,required this.onTap,required this.initSelect});

  @override
  State<CustomMultiSelectRequestCard> createState() =>
      _CustomMultiSelectRequestCardState();
}

class _CustomMultiSelectRequestCardState
    extends State<CustomMultiSelectRequestCard> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.requestList.length * 32.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.requestList.length,
            itemBuilder: (context, index) {
              ///--------------------------------
              var services = widget.requestList[index];
              bool isSelected = widget.initSelect == index;
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///--------------------------------Request---------------------------->
                      Expanded(
                        child: Row(
                          children: [
                            ///----------------------------if selected show selected and if unselected show unSelected------------------------------>
                            isSelected
                                ? SvgPicture.asset(
                                    AppIcons.radioButton,
                                    height: 20.h,
                                    width: 20.w,
                                  )
                                : Container(
                                    height: 20.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: AppColors.primaryColor)),
                                  ),

                            SizedBox(
                              width: 12.w,
                            ),

                            Expanded(
                              child: CustomText(
                                textAlign: TextAlign.start,
                                text: "${services.name}",
                                fontsize: 14.h,
                              ),
                            )
                          ],
                        ),
                      ),

                      Row(
                        children: [
                          CustomText(
                            text: services.subTitle??"",
                            fontsize: 14.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomText(
                            text: "${services.price}",
                            fontsize: 14.h,
                            color: AppColors.primaryColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

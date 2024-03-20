

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import 'custom_text.dart';

class CustomMultiSelectRequestCard extends StatefulWidget {


  List requestList;
  List selectedRequestsEmpty;


  CustomMultiSelectRequestCard({required this.requestList,required this.selectedRequestsEmpty});

  @override
  State<CustomMultiSelectRequestCard> createState() => _CustomMultiSelectRequestCardState();
}


class _CustomMultiSelectRequestCardState extends State<CustomMultiSelectRequestCard> {





  void _selecteItem(int index) {
    setState(() {
      if (widget.selectedRequestsEmpty.contains(index)) {
        widget.selectedRequestsEmpty.remove(index);
      } else {
        widget.selectedRequestsEmpty.add(index);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: widget.requestList.length* 32.h,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.requestList.length,
            itemBuilder: (context, index) {
              ///--------------------------------
              var services = widget.requestList[index];
              bool isSelected = widget.selectedRequestsEmpty.contains(index);
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selecteItem(index);
                      print("------------------------${widget.selectedRequestsEmpty}");
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///--------------------------------Request---------------------------->
                      Row(
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

                          CustomText(
                            text: "${services["required"]}",
                            fontsize: 14.h,
                          )
                        ],
                      ),

                      Row(
                        children: [
                          CustomText(
                            text: "${services["per"]}",
                            fontsize: 14.h,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomText(
                            text: "${services["quantity"]}",
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

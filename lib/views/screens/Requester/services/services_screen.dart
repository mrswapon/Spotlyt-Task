import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/utils/app_strings.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../../../controller/requesterController/services_controller.dart';
import '../../../../models/requester_home_screen_model.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_cetegory_botton.dart';
import '../../../widgets/custom_multi_select_request_card.dart';
import '../../../widgets/custom_quentity_card.dart';
import '../../../../controller/requesterController/requester_home_controller.dart';

class MediaServicesScreen extends StatefulWidget {
  MediaServicesScreen({
    super.key,
  });

  @override
  State<MediaServicesScreen> createState() => _MediaServicesScreenState();
}

class _MediaServicesScreenState extends State<MediaServicesScreen> {
  final ServiceController _serviceController = Get.put(ServiceController());
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();
  final addLinkCtrl = TextEditingController();

  final RequesterHomeController requesterHomeController =
      Get.put(RequesterHomeController());

  //=====================================> Load Counter Method <==================================
  final _counter = 1000;
  Future _loadCounter() async {
    setState(() {
      _counter ?? 1000;
    });
  }

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  var data = Get.parameters;
  Attributes attributes = Get.arguments as Attributes;

  final List<String> interests = [
    "Music",
    "Fitness",
    "Food",
    "Fashion",
    "Tech",
    "Travel",
    "Outdoor",
    "DIY",
    "Houses",
    "Pets",
    "Movies",
    'Art',
    'Career',
    "Sports",
    'Books',
    'Cars',
    'Games',
    'Shopping',
    'Finance',
    'Investing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomText(
          text: AppString.requestForServices,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.selectCategoryThatYouWantService,
                fontWeight: FontWeight.w500,
                bottom: 6.h,
              ),

              ///-----------------------------select category botton----------------------->
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: attributes.categories!.length,
                  itemBuilder: (BuildContext context, int index) {
                    ///--------------------------obx-------------------------------------------???
                    var category = attributes.categories![index];

                    return Obx(
                      () => Padding(
                        padding: EdgeInsets.only(right: 23.w),
                        child: GestureDetector(
                          onTap: () {
                            _serviceController.setSelectedCategory(index);
                            _serviceController.selectedServiceIndex.value = 0;
                          },
                          child: CustomCetegoryBotton(
                            isSelected:
                                _serviceController.selectedCategoryIndex.value == index,
                            name: "${category.name}",
                            icon: category.name == "Facebook"
                                ? AppIcons.facebook
                                : category.name == "Youtube"
                                    ? AppIcons.youtube
                                    : category.name == "Tiktok"
                                        ? AppIcons.tiktok
                                        : category.name == "Instagram"
                                            ? AppIcons.instagram
                                            : AppIcons.corporateIcon,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              ///-----------------------------------select the Required service you want--------------------------------------------->
              CustomText(
                text: AppString.selectTheRequiredServiceyouWant,
                fontWeight: FontWeight.w500,
                top: 27.h,
                bottom: 16.h,
              ),

              ///----------------------------------------select required service list view-------------------------->

              Obx(
                () => CustomMultiSelectRequestCard(
                  requestList: attributes
                          .categories?[_serviceController.selectedCategoryIndex.value]
                          .service ?? [],
                  onTap: (index) {
                    _serviceController.selectedServiceIndex.value = index;
                  },
                  initSelect: _serviceController.selectedServiceIndex.value,
                ),
              ),

              ///-------------------------------------------Add Quantity text---------------------------------------------->
              CustomText(
                text: AppString.addQuantity,
                fontWeight: FontWeight.w500,
                top: 24.h,
                bottom: 12.h,
              ),

              ///-----------------------------Quantity Card-------------------------------?>
              Obx(
                () => CustomQuentityCard(
                  decrement: _serviceController.decrementQuantity,
                  increment: _serviceController.incrementQuantity,
                  quantityCounter: _serviceController.quantity.value,
                ),
              ),

              ///-------------------------------------------select time line text---------------------------------------------->
              if (attributes.name == "Corporate")
                CustomText(
                  text: AppString.selectTimeline,
                  fontWeight: FontWeight.w500,
                  top: 16.h,
                  bottom: 12.h,
                ),

              ///--------------------------------select time line form-------------------------------->
              if (attributes.name == "Corporate")
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _serviceController.startDateCtrl,
                        decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    _serviceController.startDate(context);
                                  },
                                  child: SvgPicture.asset(
                                    AppIcons.calendar,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            filled: true,
                            fillColor: AppColors.fillColorGreen,
                            hintText: "Start Date"),
                      ),
                    ),
                    SizedBox(width: 17.w),
                    Expanded(
                      child: TextFormField(
                        controller: _serviceController.endDateCtrl,
                        decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    _serviceController.endDate(context);
                                  },
                                  child: SvgPicture.asset(
                                    AppIcons.calendar,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            filled: true,
                            fillColor: AppColors.fillColorGreen,
                            hintText: "End Date"),
                      ),
                    ),
                  ],
                ),

              ///-------------------------------------------add link text---------------------------------------------->
              CustomText(
                text: AppString.addLink,
                fontWeight: FontWeight.w500,
                top: 16.h,
                bottom: 12.h,
              ),

              ///--------------------------------Add Link form-------------------------------->
              TextFormField(
                controller: _serviceController.addLinkCtrl,
                decoration: InputDecoration(
                    prefixIcon: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: SvgPicture.asset(
                          AppIcons.linkIcon,
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    filled: true,
                    fillColor: AppColors.fillColorGreen,
                    hintText: "https://"),
              ),

              ///-------------------------------------------add interest---------------------------------------------->
              CustomText(
                text: AppString.addInterest,
                fontWeight: FontWeight.w500,
                top: 16.h,
                bottom: 12.h,
              ),

              ///-------------------------Add Interest------------------>

              SizedBox(
                child: DropdownButtonFormField(
                  icon: const Icon(Icons.keyboard_arrow_down_sharp,
                      color: Colors.black),
                  onChanged: (value) {
                    print("====> interest :  $value");
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    isDense: true,
                    filled: true,
                    fillColor: AppColors.fillColorGreen,
                    hintText: AppString.addPerferabelInterest,
                    hintStyle: const TextStyle(color: Color(0xff767676)),
                  ),
                  items: interests.map((String interest) {
                    return _dropdownMenuItem(interest);
                  }).toList(),
                ),
              ),

              SizedBox(height: 26.h),

              ///----------------------------------------------------------------------------------------->
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///-----------------------------Total payable text----------------------------->
                  CustomText(
                    text: AppString.totalPayable,
                    fontWeight: FontWeight.w500,
                  ),
                  Obx(() {
                    return CustomText(
                      text: "R ${_serviceController.quantity.value*0.60}",
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      fontsize: 18.h,
                    );
                  }),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),

              ///--------------------------Continue botton-------------------------------->
              CustomButton(
                  title: "Continue",
                  onpress: () {
                    _serviceController.requesterSubmitTask(
                      "${requesterHomeController.homeScreenModel?.data?.attributes?[1].name}",
                      "${requesterHomeController.homeScreenModel?.data?.attributes?[1].sId}",
                    );
                  }),

              SizedBox(height: 50.h)
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _dropdownMenuItem(String value) {
    return DropdownMenuItem(
      value: value,
      child: CustomText(
        text: value,
      ),
    );
  }
}

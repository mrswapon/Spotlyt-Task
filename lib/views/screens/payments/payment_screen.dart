import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_dimentions.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import 'package:spotlyt_task/views/widgets/custom_button.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import 'InnerWidget/text_form_section.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = -1;

  List paymentCards = [
    "${AppImages.visaCard}",
    "${AppImages.masterCard}",
    "${AppImages.paypalCard}"
  ];

  void selectedIndexCard(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: CustomText(
          text: AppString.makePayment,
          fontsize: 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.selectPaymentMethod,
              fontsize: 18.h,
              fontWeight: FontWeight.w500,
              top: 24.h,
              bottom: 16.h,
            ),

            ///------------------------------payment card list view-------------------------------------->
            SizedBox(
              height: 72.h,
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: paymentCards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexCard(index);
                          print("------------------------------$index");
                        });
                      },
                      child: SizedBox(
                        width: 72.w,
                        height: 72.h,
                        child: Stack(
                          children: [

                            ///------------------------------payment card image---------------------------------->
                            Image.asset(
                              "${paymentCards[index]}",
                              height: 72.h,
                              fit: BoxFit.cover,
                            ),


                            ///-----------------------------payment selected or not condition--------------------------->
                            selectedIndex == index
                                ? Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                          color: AppColors.primaryColor),
                                      child: Center(
                                          child: Icon(
                                        Icons.done_rounded,
                                        color: Colors.white,
                                        size: 20.r,
                                      )),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24.h,),


            ///------------------------text form section---------------------------->
            TextFormSection(),

            Spacer(),


            ///-------------------------- make payment botton------------------------------->
            CustomButton(title: AppString.makePayment, onpress: (){
              Get.toNamed(AppRoutes.requesterBottomNavBar);
            }),


            SizedBox(
              height: 24.h,
            ),

          ],
        ),
      ),
    );
  }
}


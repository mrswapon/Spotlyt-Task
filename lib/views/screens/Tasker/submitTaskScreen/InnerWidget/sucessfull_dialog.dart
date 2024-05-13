import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../widgets/custom_button.dart';

class CustomSuccessAlertBox extends StatefulWidget {
  const CustomSuccessAlertBox({super.key,required this.title,required this.subTitle});
  final String title;
  final String subTitle;
  @override
  State<CustomSuccessAlertBox> createState() => _CustomSuccessAlertBoxState();
}

class _CustomSuccessAlertBoxState extends State<CustomSuccessAlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        height: 250,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 80,),
                Column(
                  children: [
                    Text(widget.title,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color:Colors.black,) ,),
                    const SizedBox(height: 10,),
                    Text(widget.subTitle,textAlign: TextAlign.center,style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color:Colors.black54,) ,),
                  ],
                ),
                CustomButton(
                  height: 30,
                  onpress: () {
                  Get.offAllNamed(AppRoutes.taskerBottomNavBar);
                }, title: 'Back to Home',

                )
              ],
            ),
             Positioned(
                top:-103,
                // left: 45,
                child: SvgPicture.asset('assets/icons/sucess_icon.svg'))
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

import '../../utils/app_icons.dart';

class CustomNoDataFound extends StatelessWidget {


  const CustomNoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45.r),
      child: Center(child: SvgPicture.asset(AppIcons.notDataFound,height: 200.h,width: 230.w,)),
    );
  }
}

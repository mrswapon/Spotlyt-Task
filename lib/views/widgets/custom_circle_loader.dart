import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomCircleLoader extends StatelessWidget {
  const CustomCircleLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child:CircularProgressIndicator(color:AppColors.primaryColor,),);
  }
}
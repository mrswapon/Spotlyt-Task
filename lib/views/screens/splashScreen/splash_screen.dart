import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA0C5A0),
      body: Column(
        children: [
          //=======================================> Background Section <==========================================
          Container(
            width: 393.w,
            height: 692.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.splashBg), fit: BoxFit.fill)),
            //=======================================> App Logo Section <==========================================
            child: Center(
                child:
                    Image.asset(AppImages.appLogo, width: 168.w, height: 48.h)),
          ),
        ],
      ),
    );
  }
}

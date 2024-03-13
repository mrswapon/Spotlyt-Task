
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState() {
    super.initState();
    _navigateToLoginScreen();
  }

  void _navigateToLoginScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.signInScreen);
    });
  }


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

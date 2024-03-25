
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/helpers/Bindings/prefs_helper.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import 'package:spotlyt_task/utils/app_strings.dart';

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

  void _navigateToLoginScreen() async{
    // var data = await PrefsHelper.getString(AppString.bearerToken);
    // print("=====$data");
    Future.delayed(const Duration(seconds: 3), () {
      // Get.offAllNamed(AppRoutes.signInScreen);
      Get.offAllNamed(AppRoutes.requesterBottomNavBar);

    });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff318130),
      body: Column(
        children: [
          //=======================================> Background Section <==========================================
          Container(
            width: 393.w,
            height: 742.h,
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

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:spotlyt_task/helpers/prefs_helper.dart';
import 'package:spotlyt_task/routes/app_routes.dart';
import 'package:spotlyt_task/utils/app_images.dart';
import 'package:spotlyt_task/utils/app_strings.dart';

import '../../../utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    StreamSubscription;
    getConnectivity();
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


  ///===================internet connection checker==================>
  StreamSubscription? streamSubscription;
  bool isConnection = false;

  ///========================is internet connection check========================>
  void getConnectivity() {
    streamSubscription =
        Connectivity().onConnectivityChanged.listen((event) async {
      isConnection = await InternetConnectionChecker().hasConnection;

      ///==================if internet is available===================>
      if (isConnection) {
        print("------------------Internet available");
        Timer(const Duration(seconds: 4), () async {
          bool isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
          String token = await PrefsHelper.getString(AppConstants.bearerToken);
          String role = await PrefsHelper.getString(AppConstants.role);
          print("================>   $isLogged \n $token \n $role");

          ///========================check islogged in, token, and role then decide where will be navigate====================>
          if (isLogged) {
            if (token.isNotEmpty) {
              if (role == "client") {
                Get.offAllNamed(AppRoutes.requesterBottomNavBar);
              } else {
                Get.offAllNamed(AppRoutes.taskerBottomNavBar);
              }
            }
          } else {
            Get.offAllNamed(AppRoutes.signInScreen);
          }
        });
      }

      ///======================no internet=========================>
      else {
        Fluttertoast.showToast(msg: "Please connect your internet");
        print("----------------------No internet");
        return null;
      }
    });
  }
}

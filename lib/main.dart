import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/themes/app_themes.dart';
import 'package:spotlyt_task/views/screens/splashScreen/splash_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Spotlyt',
              theme: Themes().lightTheme,
            //  darkTheme: Themes().darkTheme,
              initialRoute: AppRoutes.splashScreen,
              getPages: AppRoutes.routes,
              home: SplashScreen(),
            ),
        designSize: const Size(393, 852));
  }
}

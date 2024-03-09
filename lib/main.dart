import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/themes/app_themes.dart';
import 'routes/app_routes.dart';
import 'views/screens/bottom_nav_bar/bottom_nav_bar.dart';

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
              title: 'Spotlyt Task',
              theme: Themes().lightTheme,
              darkTheme: Themes().darkTheme,
              initialRoute: AppRoutes.bottomNavBar,
              getPages: AppRoutes.routes,
              home: BottomNavBar(),
            ),
        designSize: const Size(393, 852));
  }
}

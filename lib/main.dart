import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/themes/app_themes.dart';
import 'package:spotlyt_task/views/screens/Tasker/registerScreen/register_screen.dart';
import 'package:spotlyt_task/views/screens/splashScreen/splash_screen.dart';
import 'routes/app_routes.dart';
import 'views/screens/Tasker/taskerTaskDetails/tasker_task_details_screen.dart';

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
              initialRoute: AppRoutes.taskerTaskDetailsScreen,
              getPages: AppRoutes.routes,
              home: TaskerTaskDetailsScreen(),
            ),
        designSize: const Size(393, 852));
  }
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/themes/app_themes.dart';
import 'package:spotlyt_task/views/screens/Tasker/registerScreen/register_screen.dart';
import 'package:spotlyt_task/views/screens/splashScreen/splash_screen.dart';
import 'routes/app_routes.dart';
import 'views/screens/Tasker/taskerTaskDetails/tasker_task_details_screen.dart';

void main() {
  runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(

          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,

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

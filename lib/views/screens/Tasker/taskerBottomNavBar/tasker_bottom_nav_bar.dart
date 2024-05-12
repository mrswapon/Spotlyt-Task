import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:get/get.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerBottomNavBar/tasker_bottom_controller.dart';
import 'package:spotlyt_task/views/screens/Tasker/taskerHomeScreen/tasker_home_screen.dart';
import '../../../../utils/app_icons.dart';
import '../../ProfileScreen/profile_screen.dart';
import '../taskerTaskScreen/tasker_task_screen.dart';

class TaskerBottomNavBar extends StatefulWidget {
  const TaskerBottomNavBar({super.key});

  @override
  State<TaskerBottomNavBar> createState() => _TaskerBottomNavBarState();
}

class _TaskerBottomNavBarState extends State<TaskerBottomNavBar> {
  final TaskerBottomController _taskerBottomController =Get.put(TaskerBottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      ///--------------------------body section--------------------------->
      body: Obx(()=>pageControll(_taskerBottomController.selectIndex.value)),

      ///---------------------------botton nav bar------------------------>
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.scaffoldBg,
        height: 67.h,
        color: AppColors.primaryColor,
        iconPadding: 10,
        index: _taskerBottomController.selectIndex.value,
        items: [
          ///-------------------home---------------------->
          CurvedNavigationBarItem(
            labelStyle: const TextStyle(color: Colors.white),
            child: SvgPicture.asset(
              AppIcons.homeIcon,
              color: Colors.white,
            ),
            label: 'Home',
          ),

          ///-------------------task---------------------->
          CurvedNavigationBarItem(
            child: SvgPicture.asset(
              AppIcons.task,
              color: Colors.white,
            ),
            label: 'Task',
            labelStyle: const TextStyle(color: Colors.white),
          ),

          ///-------------------profile---------------------->
          CurvedNavigationBarItem(
            child: SvgPicture.asset(
              AppIcons.profile,
              color: Colors.white,
            ),
            label: 'Profile',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],
        onTap: _taskerBottomController.updateIndex,
      ),
    );
  }

  pageControll(int index) {
    switch (index) {
      case 0:
        return TaskerHomeScreen();
      case 1:
        return TaskerTaskScreen();
      default:
        return ProfileScreen();
    }
  }
}

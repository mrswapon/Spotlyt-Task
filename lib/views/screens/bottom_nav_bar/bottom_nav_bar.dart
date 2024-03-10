import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:spotlyt_task/utils/app_colors.dart';
import 'package:spotlyt_task/views/screens/home/home_screen.dart';
import 'package:spotlyt_task/views/screens/profile/profileScreen/profile_screen.dart';

import '../../../utils/app_icons.dart';
import '../task/task_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      ///--------------------------body section--------------------------->
      body: pageControll(_index),


      ///---------------------------botton nav bar------------------------>
      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: AppColors.scaffoldBg,
         height: 67.h,
         color: AppColors.primaryColor,
        iconPadding: 10,

        items:  [

          ///-------------------home---------------------->
          CurvedNavigationBarItem(
            labelStyle: const TextStyle(color: Colors.white),
            child: SvgPicture.asset(AppIcons.home,color: Colors.white,),
            label: 'Home',
          ),

          ///-------------------task---------------------->
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIcons.task,color: Colors.white,),
            label: 'Task',
            labelStyle: const TextStyle(color: Colors.white),
          ),


          ///-------------------profile---------------------->
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIcons.profile,color: Colors.white,),
            label: 'Profile',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ],

        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),

    );
  }

  pageControll(int index){
    switch (index){
      case 0 : return HomeScreen();
      case 1 : return TaskScreen();
      default : return ProfileScreen();
    }
  }

}

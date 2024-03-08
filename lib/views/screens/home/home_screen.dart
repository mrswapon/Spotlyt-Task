import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlyt_task/views/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: [



          CustomText(text: "Sagor ahamed",),
          Text("Sagor ahamed",style: TextStyle(fontSize: 20.h, fontWeight: FontWeight.w700)),
          CustomText(text: "Sagor ahamed",fontWeight: FontWeight.w700, fontsize: 20.h,)

        ],
      ),
    );
  }
}

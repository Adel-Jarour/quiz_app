import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constance/color_const.dart';
import '../widgets/custem_text.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          txt: "Start Quiz",
          color: ColorConst.primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConst.primaryColor,
          ),
        ),
      ),
    );
  }
}

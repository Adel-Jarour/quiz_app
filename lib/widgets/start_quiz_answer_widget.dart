
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constance/color_const.dart';
import 'custem_text.dart';

class StartQuizAnswerWidget extends StatelessWidget {
  const StartQuizAnswerWidget({
    super.key,
    required this.answer,
    required this.onTap,
  });

  final String answer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          width: double.infinity,
          padding:
          EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: ColorConst.primaryColor, width: 2),
          ),
          alignment: Alignment.centerLeft,
          child: CustomText(
            txt: answer,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}

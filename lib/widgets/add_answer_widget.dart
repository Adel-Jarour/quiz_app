
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custem_text.dart';
import 'custom_text_form_field.dart';

class AddAnswerWidget extends StatelessWidget {
  const AddAnswerWidget({
    super.key,
    required this.textEditingController,
    required this.hint,
    required this.label,
    required this.color,
    required this.order,
  });

  final TextEditingController textEditingController;
  final Color color;
  final String hint;
  final String label;
  final String order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          alignment: Alignment.center,
          child: CustomText(
            txt: order,
            color: Colors.white,
            fontSize: 30.sp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: CustomTextFormField(
            controller: textEditingController,
            label: label,
            hintTxt: hint,
          ),
        ),
      ],
    );
  }
}

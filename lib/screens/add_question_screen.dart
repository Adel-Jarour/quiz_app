import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/add_question_controller.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/widgets/add_answer_widget.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text_form_field.dart';

import '../constance/color_const.dart';
import '../widgets/custem_text.dart';

class AddQuestionScreen extends StatelessWidget {
  AddQuestionScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddQuestionController controller =
        Get.put(AddQuestionController(formKey: formKey));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: CustomText(
          txt: "Add Question",
          color: ColorConst.primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            // Get.back();
            Get.toNamed(Routes.createQuiz);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorConst.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller.question,
                  label: "Question",
                  hintTxt: "Question",
                  prefixIcon: const Icon(Icons.question_mark),
                ),
                SizedBox(
                  height: 40.h,
                ),
                const _AnswerFieldsWidget(),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CustomText(txt: "Select the correct answer"),
                    GetBuilder<AddQuestionController>(
                      builder: (_) => DropdownButton(
                        value: controller.dropdownValue,
                        items: ['A', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: CustomText(txt: value, color: ColorConst.primaryColor,),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          controller.changeDropdownValue(value!);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  txt: "SUBMIT",
                  onTap: () {
                    controller.performSubmit();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnswerFieldsWidget extends StatelessWidget {
  const _AnswerFieldsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddQuestionController>(
      builder: (controller) => Column(
        children: [
          AddAnswerWidget(
            textEditingController: controller.answer1,
            hint: "First answer",
            label: "First answer",
            color: Colors.yellow.shade600,
            order: "A",
          ),
          SizedBox(
            height: 20.h,
          ),
          AddAnswerWidget(
            textEditingController: controller.answer2,
            hint: "Second answer",
            label: "Second answer",
            color: Colors.green.shade600,
            order: "B",
          ),
          SizedBox(
            height: 20.h,
          ),
          AddAnswerWidget(
            textEditingController: controller.answer3,
            hint: "Third answer",
            label: "Third answer",
            color: Colors.blueGrey.shade600,
            order: "C",
          ),
          SizedBox(
            height: 20.h,
          ),
          AddAnswerWidget(
            textEditingController: controller.answer4,
            hint: "Fourth answer",
            label: "Fourth answer",
            color: Colors.pink.shade600,
            order: "D",
          ),
        ],
      ),
    );
  }
}

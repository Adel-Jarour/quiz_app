import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/controllers/create_quiz_controller.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/widgets/custom_button.dart';

import '../constance/color_const.dart';
import '../widgets/custem_text.dart';
import 'package:get/get.dart';

class CreateQuizScreen extends StatelessWidget {
  CreateQuizScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          txt: "Create Quiz",
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(Routes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
          top: 20.h,
          bottom: 5.h,
        ),
        child: GetBuilder<CreateQuizController>(
          init: CreateQuizController(),
          builder: (controller) => Column(
            children: [
              CustomButton(
                  txt: "+ Add new question",
                  onTap: () {
                    Get.toNamed(Routes.addQuestion);
                  }),
              SizedBox(
                height: 30.h,
              ),
              controller.loading ?
              const Center(child: CupertinoActivityIndicator())
                  :
              controller.questions.isNotEmpty
                  ? Expanded(
                      child: _QuestionWidget(),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 50.h,),
                        Image.asset(
                          "assets/images/faq.png",
                          scale: 10,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomText(
                          txt: "Please add some questions!",
                          fontSize: 20.sp,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: const _FloatingWidget(),
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  _QuestionWidget({
    super.key,
  });

  CreateQuizController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.only(
            top: 15.h,
            start: 10.w,
            end: 10.w,
            bottom: 10.h,
          ),
          margin: EdgeInsetsDirectional.only(bottom: 15.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              ListTile(
                title: CustomText(
                  txt:
                      "${controller.questions[index].question}",
                  height: 1.5,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Delete question",
                      content: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            const CustomText(
                              txt:
                                  "Are you sure you want to delete this question?",
                              color: Colors.black,
                              height: 1.3,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                CustomButton(
                                  txt: "Cancel",
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  colorButton: Colors.white,
                                  colorTxt: ColorConst.primaryColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CustomButton(
                                  txt: "Delete",
                                  onTap: () {
                                    controller.deleteQuestion(
                                      controller.questions[index].id!,
                                    );
                                    Navigator.pop(context);
                                  },
                                  colorButton: Colors.white,
                                  colorTxt: ColorConst.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
              SizedBox(height: 5.h),
              _AnswerWidget(
                answer: controller.questions[index].answer1 ?? "",
                condition: (controller.questions[index].correctAnswer == "A"),
              ),
              SizedBox(height: 13.h),
              _AnswerWidget(
                answer: controller.questions[index].answer2 ?? "",
                condition: (controller.questions[index].correctAnswer == "B"),
              ),
              SizedBox(height: 13.h),
              _AnswerWidget(
                answer: controller.questions[index].answer3 ?? "",
                condition: (controller.questions[index].correctAnswer == "C"),
              ),
              SizedBox(height: 13.h),
              _AnswerWidget(
                answer: controller.questions[index].answer4 ?? "",
                condition: (controller.questions[index].correctAnswer == "D"),
              ),
            ],
          ),
        );
      },
      itemCount: controller.questions.length,
    );
  }
}

class _AnswerWidget extends StatelessWidget {
  const _AnswerWidget({
    super.key,
    required this.answer,
    required this.condition,
  });

  final String answer;
  final bool? condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
        top: 15.h,
        start: 10.w,
        end: 10.w,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: condition! ? Colors.green : ColorConst.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: CustomText(
        txt: answer,
        height: 1.3,
        color: condition! ? Colors.white : Colors.black,
      ),
    );
  }
}

class _FloatingWidget extends StatelessWidget {
  const _FloatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorConst.primaryColor,
      onPressed: () {
        Get.toNamed(Routes.addQuestion);
      },
      child: const Icon(Icons.add),
    );
  }
}

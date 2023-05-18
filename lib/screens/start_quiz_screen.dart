import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/start_quiz_controller.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/start_quiz_answer_widget.dart';

import '../constance/color_const.dart';
import '../constance/list_const.dart';
import '../widgets/custem_text.dart';

class StartQuizScreen extends StatelessWidget {
  StartQuizScreen({Key? key}) : super(key: key);

  StartQuizController controller = Get.put(StartQuizController());

  @override
  Widget build(BuildContext context) {
    controller.getAllQuestions();
    return GetBuilder<StartQuizController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: CustomText(
            txt: "Quiz App",
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
        body: (controller.questions.length > 4)
            ? const QuizWidget()
            : const NoEnoughQuestions(),
      ),
    );
  }
}

class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
      child: GetBuilder<StartQuizController>(
        builder: (controller) =>
            controller.showResult ? ResultWidget() : QuestionsWidget(),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  ResultWidget({
    super.key,
  });

  StartQuizController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        CustomText(
          txt: ListConst.results[controller.index].title,
          fontSize: 25.sp,
          color: ColorConst.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 45.h,
        ),
        Image.asset(
          ListConst.results[controller.index].image,
          scale: 2,
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomText(
          txt:
              "Your Score: ${controller.equalCount} / ${controller.selectedAnswer.length}",
          fontSize: 22.sp,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomText(
          txt: ListConst.results[controller.index].msg,
          fontSize: 18.sp,
          color: Colors.black,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomButton(
            txt: "Back to home",
            width: 200.w,
            onTap: () {
              Get.back();
            }),
      ],
    );
  }
}

class QuestionsWidget extends StatelessWidget {
  QuestionsWidget({
    super.key,
  });

  StartQuizController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              txt: "Question ${controller.currentPage + 1} ",
              fontSize: 20.sp,
              color: ColorConst.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              txt: " / ${controller.questions.length}",
              fontSize: 13.sp,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        SizedBox(
          height: 40.h,
        ),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.questions.length,
            controller: controller.pageController,
            onPageChanged: (int page) {
              controller.onPageChanged(page);
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 15.w, vertical: 20.h),
                    margin: EdgeInsetsDirectional.only(
                        bottom: 20.h, start: 10.w, end: 10.w),
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      txt: controller.questions[index].question,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  StartQuizAnswerWidget(
                    answer: controller.questions[index].answer1 ?? "",
                    onTap: () {
                      controller.nextPage("A");
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  StartQuizAnswerWidget(
                    answer: controller.questions[index].answer2 ?? "",
                    onTap: () {
                      controller.nextPage("B");
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  StartQuizAnswerWidget(
                    answer: controller.questions[index].answer3 ?? "",
                    onTap: () {
                      controller.nextPage("C");
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  StartQuizAnswerWidget(
                    answer: controller.questions[index].answer4 ?? "",
                    onTap: () {
                      controller.nextPage("D");
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NoEnoughQuestions extends StatelessWidget {
  const NoEnoughQuestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            txt: "Sorry!",
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.primaryColor,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomText(
            txt: "you must add at least 5 questions to start",
            fontSize: 15.sp,
          ),
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            "assets/images/faq.png",
            scale: 10,
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomButton(
              txt: "Back to home",
              width: 250.w,
              onTap: () {
                Get.toNamed(Routes.home);
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/widgets/custom_button.dart';

import '../constance/color_const.dart';
import '../widgets/custem_text.dart';
import 'package:get/get.dart';

class CreateQuizScreen extends StatelessWidget {
  const CreateQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          txt: "Create Quiz",
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
      body: Padding(
        padding: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
          top: 20.h,
          bottom: 5.h,
        ),
        child: Column(
          children: [
            CustomButton(txt: "+ Add new question", onTap: () {
              Get.toNamed(Routes.addQuestion);
            }),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _QuestionWidget();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const _FloatingWidget(),
    );
  }
}




class _QuestionWidget extends StatelessWidget {
  const _QuestionWidget({
    super.key,
  });

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
      margin: EdgeInsetsDirectional.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: const CustomText(
              txt: "question here",
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
                          txt: "Are you sure you want to delete this question?",
                          color: Colors.black,
                          height: 1.3,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            CustomButton(
                              txt: "Cancel",
                              onTap: () {},
                              colorButton: Colors.white,
                              colorTxt: ColorConst.primaryColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomButton(
                              txt: "Delete",
                              onTap: () {},
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
            onTap: () {},
            answer: "answer 1",
          ),
          SizedBox(height: 13.h),
          _AnswerWidget(
            onTap: () {},
            answer: "answer 2",
          ),
          SizedBox(height: 13.h),
          _AnswerWidget(
            onTap: () {},
            answer: "answer 3",
          ),
          SizedBox(height: 13.h),
          _AnswerWidget(
            onTap: () {},
            answer: "answer 4",
          ),
        ],
      ),
    );
  }
}


class _AnswerWidget extends StatelessWidget {
  const _AnswerWidget({
    super.key,
    required this.onTap,
    required this.answer,
  });

  final String answer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(
          top: 15.h,
          start: 10.w,
          end: 10.w,
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          color: ColorConst.backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: CustomText(
          txt: answer,
          height: 1.3,
        ),
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

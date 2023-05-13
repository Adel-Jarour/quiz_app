import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/widgets/custem_text.dart';

import '../db_controller/db_helper.dart';

class AddQuestionController extends GetxController {
  late TextEditingController question;
  late TextEditingController answer1;
  late TextEditingController answer2;
  late TextEditingController answer3;
  late TextEditingController answer4;
  late TextEditingController correctAnswer;

  String dropdownValue = 'A';

  void changeDropdownValue(String value) {
    dropdownValue = value;
    update();
  }

  GlobalKey<FormState> formKey;

  AddQuestionController({required this.formKey});

  bool isSubmit = false;

  bool checkData() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  saveDataToDB() async {
    await DatabaseHelper().addQuestion(
      question.text,
      answer1.text,
      answer2.text,
      answer3.text,
      answer4.text,
      dropdownValue,
    );
  }

  void performSubmit() async {
    if (checkData()) {
      isSubmit = true;
      update();
      await saveDataToDB();
      Get.snackbar(
        "",
        "",
        icon: const Icon(Icons.verified, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        titleText: CustomText(
          txt: "Add Question",
          fontSize: 18.sp,
        ),
        messageText: CustomText(
          txt: "question added successfully",
          color: Colors.black,
          fontSize: 15.sp,
        ),
        padding: EdgeInsets.all(20.0.r),
        borderRadius: 27.0,
        backgroundColor: Colors.white60,
      );
      isSubmit = false;
      question.clear();
      answer1.clear();
      answer2.clear();
      answer3.clear();
      answer4.clear();
      correctAnswer.clear();
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    question = TextEditingController();
    answer1 = TextEditingController();
    answer2 = TextEditingController();
    answer3 = TextEditingController();
    answer4 = TextEditingController();
    correctAnswer = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    question.dispose();
    answer1.dispose();
    answer2.dispose();
    answer3.dispose();
    answer4.dispose();
    correctAnswer.dispose();
  }
}

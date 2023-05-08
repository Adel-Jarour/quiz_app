
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddQuestionController extends GetxController{

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

  void performSubmit() {
    if (checkData()) {
      isSubmit = true;
      update();

      // save data in sql db

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
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../db_controller/db_helper.dart';
import '../models/question_model.dart';

class StartQuizController extends GetxController {
  List<QuestionModel> questions = [];

  Future getAllQuestions() async {
    questions = [];
    final res = await DatabaseHelper().getQuestions();
    for (var i in res!) {
      questions.add(QuestionModel.fromMap(i));
    }
    update();
  }

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;


  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}

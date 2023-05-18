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
      correctAnswer.add(i['correctAnswer']);
    }
    update();
  }

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  bool showResult = false;

  nextPage(String index) {
    if (lastQuestion()) {
      selectedAnswer.add(index);
      showResult = true;
      calculateResult();
      ratioResult();
    } else {
      selectedAnswer.add(index);
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    print(selectedAnswer);
    update();
  }

  bool lastQuestion() {
    return currentPage + 1 == questions.length;
  }

  List<String?> selectedAnswer = [];
  List<String?> correctAnswer = [];

  int equalCount = 0;

  void calculateResult() {
    for (int i = 0; i < selectedAnswer.length; i++) {
      if (selectedAnswer[i] == correctAnswer[i]) {
        equalCount++;
      }
    }
    print("equalCount is: $equalCount");
  }

  int index = 0;

  void ratioResult() {
    double ratio = (equalCount / correctAnswer.length) * 100;
    if(ratio < 50.0){
      index = 0;
    }else if(ratio >= 50.0 && ratio < 80.0) {
      index = 1;
    }
    else{
      index = 2;
    }
    print("ratio result is: $ratio %");
    update();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}

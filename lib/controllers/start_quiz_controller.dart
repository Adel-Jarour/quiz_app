import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../db_controller/db_helper.dart';
import '../models/question_model.dart';

class StartQuizController extends GetxController {


  List<QuestionModel> questions = [];
  List<String?> selectedAnswer = [];
  List<String?> correctAnswer = [];


  // get all question from db
  Future getAllQuestions() async {
    questions = [];
    final res = await DatabaseHelper().getQuestions();
    for (var i in res!) {
      questions.add(QuestionModel.fromMap(i));
      correctAnswer.add(i['correctAnswer']);
    }
    update();
  }

  // for page view builder widget
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }


  /*
  save selected option,
  and if is the last element (question) in the list shows the result.
   */
  bool showResult = false;

  nextPage(String index) {
    if (lastQuestion()) {
      selectedAnswer.add(index);
      showResult = true;
      calculateCorrectAnswer();
      calculateSuccessRate();
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

  // check if is the last element (question) in the list
  bool lastQuestion() {
    return currentPage + 1 == questions.length;
  }


  // check the correct answer from what the user selected.
  int equalCount = 0;

  void calculateCorrectAnswer() {
    for (int i = 0; i < selectedAnswer.length; i++) {
      if (selectedAnswer[i] == correctAnswer[i]) {
        equalCount++;
      }
    }
    print("equalCount is: $equalCount");
  }


  // calculate the success rate from result
  int index = 0;

  void calculateSuccessRate() {
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

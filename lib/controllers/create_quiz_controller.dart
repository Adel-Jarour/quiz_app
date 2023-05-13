import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/db_controller/db_helper.dart';
import 'package:quiz_app/models/question_model.dart';

class CreateQuizController extends GetxController with RouteAware {
  List<QuestionModel> questions = [];

  Future getAllQuestions() async {
    questions = [];
    final res = await DatabaseHelper().getQuestions();
    for (var i in res!) {
      questions.add(QuestionModel.fromMap(i));
    }
    update();
  }

  Future deleteQuestion(int id) async {
    print("the element that deleted is: $id");
    final res = await DatabaseHelper().deleteQuestion(id);
    print("response to delete is: $res");
    await getAllQuestions();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

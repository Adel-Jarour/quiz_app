import 'package:get/get.dart';
import 'package:quiz_app/db_controller/db_helper.dart';
import 'package:quiz_app/models/question_model.dart';

class CreateQuizController extends GetxController {
  List<QuestionModel> questions = [];
  bool loading = false;

  Future getAllQuestions() async {
    questions = [];
    loading = true;
    update();
    final res = await DatabaseHelper().getQuestions();
    for (var i in res!) {
      questions.add(QuestionModel.fromMap(i));
    }
    loading = false;
    update();
  }

  Future deleteQuestion(int id) async {
    final res = await DatabaseHelper().deleteQuestion(id);
    await getAllQuestions();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllQuestions();
  }
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/screens/create_quiz_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';

import '../screens/add_question_screen.dart';
import '../screens/start_quiz_screen.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.createQuiz,
      page: () => CreateQuizScreen(),
    ),
    GetPage(
      name: Routes.startQuiz,
      page: () => StartQuizScreen(),
    ),
    GetPage(
      name: Routes.addQuestion,
      page: () => AddQuestionScreen(),
    ),
  ];
}

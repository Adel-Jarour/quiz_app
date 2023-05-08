class QuestionModel {
  int? id;
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  int? correctAnswer;

  QuestionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    question = map['question'];
    answer1 = map['answer1'];
    answer2 = map['answer2'];
    answer3 = map['answer3'];
    answer4 = map['answer4'];
    correctAnswer = map['correctAnswer'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['answer1'] = answer1;
    map['answer2'] = answer2;
    map['answer3'] = answer3;
    map['answer4'] = answer4;
    map['correctAnswer'] = correctAnswer;
    return map;
  }
}

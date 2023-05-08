import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:sqlite3/sqlite3.dart';

class DBProvider {
  DBProvider._();

  static DBProvider? _instance;

  static DBProvider? get instance {
    if (_instance == null) {
      _instance = DBProvider._();
      return _instance;
    }
    return _instance;
  }

  Future<Database> _openDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'quiz_app.db');
    final db = sqlite3.open(path);
    return db;
  }

  Future initDB() async {
    final db = await _openDatabase();

    db.execute('''
      CREATE TABLE IF NOT EXISTS add_question (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT NOT NULL,
        answer1 TEXT NOT NULL,
        answer2 TEXT NOT NULL,
        answer3 TEXT NOT NULL,
        answer4 TEXT NOT NULL,
        correctAnswer INTEGER NOT NULL
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS add_user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
      )
    ''');

    db.dispose();
  }

  Future<void> insertQuestion({
    required QuestionModel question,
  }) async {
    final db = await _openDatabase();

    db.execute('''
      INSERT INTO add_question (
        question, answer1, answer2, answer3, answer4, correctAnswer
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      question.question,
      question.answer1,
      question.answer2,
      question.answer3,
      question.answer4,
      question.correctAnswer
    ]);

    db.dispose();
  }

  // Future<List<QuestionModel>> getQuestions() async {
  //   final db = await _openDatabase();
  //   final results = await db.query('add_question');
  //
  //   return results.map((map) => QuestionModel.fromMap(map)).toList();
  // }

  Future<void> insertUser({
    required UserModel user,
  }) async {
    final db = await _openDatabase();

    db.execute('''
      INSERT INTO add_user (
        name, email
      ) VALUES (?, ?)
    ''', [
      user.name,
      user.email,
    ]);

    db.dispose();
  }
}

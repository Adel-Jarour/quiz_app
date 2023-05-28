import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_database.db');

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        answer1 TEXT,
        answer2 TEXT,
        answer3 TEXT,
        answer4 TEXT,
        correctAnswer TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {}


  Future<List<Map<String, dynamic>>?> getQuestions() async {
    final db = await database;
    final res = await db?.query('questions');
    return res;
  }

  Future<int?> addQuestion(String question, String answer1, String answer2,
      String answer3, String answer4, String correctAnswer) async {
    final db = await database;
    final res = await db?.insert('questions', {
      'question': question,
      'answer1': answer1,
      'answer2': answer2,
      'answer3': answer3,
      'answer4': answer4,
      'correctAnswer': correctAnswer
    });
    return res;
  }

  Future<int?> deleteQuestion(int id) async {
    final db = await database;
    final res = await db?.delete('questions', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> addUser(String username, String password) async {
    final db = await database;
    final res =
        await db?.insert('users', {'username': username, 'email': password});
    return res;
  }

  Future<Map<String, dynamic>?> getUser() async {
    final db = await database;
    final res = await db?.query('users', orderBy: 'id DESC', limit: 1);
    return res!.isNotEmpty ? res.first : null;
  }
}

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

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        q1 TEXT,
        q2 TEXT,
        q3 TEXT,
        q4 TEXT,
        answer TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');

    // Insert a default user for testing purposes
    await db.insert('users', {'username': 'admin', 'password': 'password'});
  }

  Future<int?> addUser(String username, String password) async {
    final db = await database;
    final res =
        await db?.insert('users', {'username': username, 'password': password});
    print("ADD USER SUCESS");
    return res;
  }

  Future<List<Map<String, dynamic>>?> getQuestions() async {
    final db = await database;
    final res = await db?.query('questions');
    return res;
  }

  Future<int?> addQuestion(
      String q1, String q2, String q3, String q4, String answer) async {
    final db = await database;
    final res = await db?.insert('questions',
        {'q1': q1, 'q2': q2, 'q3': q3, 'q4': q4, 'answer': answer});
    return res;
  }

  Future<Map<String, dynamic>?> getUser(String username) async {
    final db = await database;
    final res = await db?.query('users',
        where: 'username = ?', whereArgs: [username], limit: 1);
    return res!.isNotEmpty ? res.first : null;
  }
}

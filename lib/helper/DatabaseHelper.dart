import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseFilename = "t2311e_demo.db";
  static final _databaseVersion = 1;

  static final String TABLE_STUDENT = "student";
  static final String COLUMN_STUDENT_ID = "id";
  static final String COLUMN_STUDENT_NAME = "name";
  static final String COLUMN_STUDENT_EMAIL = "email";
  static final String COLUMN_STUDENT_ADDRESS = "address";
  static final String COLUMN_STUDENT_PHONE = "phone";

  DatabaseHelper._privateConstructor();

  static Database? _database;

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    print('$appDirectory');

    String path = join(appDirectory.path, _databaseFilename);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $TABLE_STUDENT (
        $COLUMN_STUDENT_ID INTEGER PRIMARY KEY AUTOINCREMENT,     
        $COLUMN_STUDENT_NAME TEXT NOT NULL,
        $COLUMN_STUDENT_EMAIL TEXT NOT NULL,
        $COLUMN_STUDENT_ADDRESS TEXT NOT NULL,
        $COLUMN_STUDENT_PHONE TEXT NOT NULL)
        ''');
  }
}

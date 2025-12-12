import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:t2311e_demo/helper/DatabaseHelper.dart';

import '../models/Student.dart';

class StudentRepository {
  final Future<Database> _db = DatabaseHelper.instance.database;

  Future<int> insert(Student student) async {
    final db = await _db;
    return await db.insert(DatabaseHelper.TABLE_STUDENT, student.toMap());
  }

  Future<List<Student>> getList() async {
    final db = await _db;
    final List<Map<String, dynamic>> mapData =
        await db.query(DatabaseHelper.TABLE_STUDENT);
    return List.generate(
        mapData.length, (index) => Student.fromMap(mapData[index]));
  }

  Future<int> update(Student student) async {
    final db = await _db;
    return await db.update(DatabaseHelper.TABLE_STUDENT, student.toMap(),
        where: '${DatabaseHelper.COLUMN_STUDENT_ID} = ?',
        whereArgs: [student.id]);
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return await db.delete(DatabaseHelper.TABLE_STUDENT,
        where: '${DatabaseHelper.COLUMN_STUDENT_ID} = ?', whereArgs: [id]);
  }
}

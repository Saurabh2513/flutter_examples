import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;
  static final DatabaseService instance = DatabaseService._constructor();
  final String _tableName = 'students';
  final String _columnNameId = 'id';
  final String _columnNameName = 'name';
  final String _columnNamePercentage = 'percentage';


  DatabaseService._constructor();

  Future<Database> get database async {
if (_database != null) return _database!;
_database = await getdatabase();
return _database!;
  }

  Future<Database> getdatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'student_leaderboard.db');
    final database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE $_tableName(
          $_columnNameId INTEGER PRIMARY KEY AUTOINCREMENT,
          $_columnNameName TEXT NOT NULL,
          $_columnNamePercentage REAL )''');
    },);
    return database;
  }
  void insertStudent(String name, double percentage) async {
    final db = await database;
    await db.insert(_tableName, {
      _columnNameName: name,
      _columnNamePercentage: percentage,
    });
  }
}

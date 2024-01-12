import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:to_do_app_v1/constans.dart';
import 'package:to_do_app_v1/feature/home/data/models/task.dart';

class AppData {
  static Database? _db;

  //getter to initialize database if there's no initial database
  static Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize DB
  static initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "Task.db");
    var myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDB;
  }

  //Create DB
  static _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Task($columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,$columnTitle TEXT NOT NULL,$columnTime TEXT NOT NULL,$columnDate TEXT NOT NULL,$columnStatus TEXT NOT NULL)');
  }

  //Insert in DB
  static Future<int> insertDB(Map<String, dynamic> data) async {
    Database? dbClient = await db;
    var result = await dbClient!.insert("Task", data);
    return result;
  }

  static updateDB({required Task task, required String status}) async {
    Database? dbClient = await db;
    var result = await dbClient?.rawUpdate(
        "Update Task SET title = '${task.title}', $columnTime = '${task.time}', $columnDate = '${task.date}', $columnStatus = '$status' Where $columnId = ${task.id}");

    return result;
  }

  //Delete all of DB
  static deleteDB(int id) async {
    Database? dbClient = await db;
    var result =
        await dbClient!.rawDelete("DELETE FROM Task WHERE $columnId = $id");
    return result;
  }

  // Get all rows in DB
  static Future<List<Task>> getAllToDoTask() async {
    List<Task> todoTask = [];
    Database? dbClient = await db;
    var result = await dbClient!
        .rawQuery("SELECT*FROM 'Task' WHERE $columnStatus='$toDoStatus'");
    for (var task in result) {
      todoTask.add(Task.fromMap(task));
    }
    return todoTask;
  }

  static Future<List<Task>> getAllArchivedTask() async {
    List<Task> archivedTask = [];
    Database? dbClient = await db;
    var result = await dbClient!
        .rawQuery("SELECT*FROM 'Task' WHERE $columnStatus='$archivedStatus'");
    for (var task in result) {
      archivedTask.add(Task.fromMap(task));
    }
    return archivedTask;
  }

  static Future<List<Task>> getAllDoneTask() async {
    List<Task> doneTask = [];
    Database? dbClient = await db;
    var result = await dbClient!
        .rawQuery("SELECT*FROM 'Task' WHERE $columnStatus='$doneStatus'");
    for (var task in result) {
      doneTask.add(Task.fromMap(task));
    }
    return doneTask;
  }
}

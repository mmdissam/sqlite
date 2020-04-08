import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

import 'package:sqlite/models/user.dart';

class DatabaseHelper {
  static Database _database;
  final String userTable = 'userTable';
  final String columnId = 'id';
  final String columnUserName = 'userName';
  final String columnPassword = 'password';
  final String columnCity = 'city';
  final String columnAge = 'age';

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    //If Database not found, initialize it.
    _database = await intDB();
    return _database;
  }

  // To initialize file, to store data in it.
  intDB() async {
    // To track the file path in the device.
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    // To associate the file path with the file name
    // (documentDirectory.path): example: C:/IUG/Database
    String path = join(documentDirectory.path, 'mydb.db');
    var myOwnDB = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // When creating the db, create the table
  _onCreate(Database db, int newVersion) async {
    var sql =
        "CREATE TABLE $userTable ($columnId INTEGER PRIMARY KEY, $columnUserName TEXT,$columnPassword TEXT,$columnCity TEXT, $columnAge INTEGER)";
    await db.execute(sql);
  }

//  To write on database
  Future<int> saveUser(User user) async {
//  To initialize database
    var dbClient = await db;
    int result = await dbClient.insert("$userTable", user.toMap());
    return result;
  }

  Future<List> getAllUsers() async {
    //  To initialize database
    var dbClient = await db;
    var sql = "SELECT * FROM $userTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getNumOfUser() async {
    //  To initialize database
    var dbClient = await db;
    var sql = "SELECT COUNT(*) FROM $userTable";
    return Sqflite.firstIntValue(await dbClient.rawQuery(sql));
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var sql = "SELECT * $userTable WHERE $columnId = $id";
    List result = await dbClient.rawQuery(sql);
//   If user not found
    if (result.length == 0) {
      return null;
    }
//  result.first TO arrange the values
    return new User.fromMap(result.first);
  }
}

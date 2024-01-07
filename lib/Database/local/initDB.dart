import 'package:download_manager/Database/local/queries.dart';
import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class CentralDB {
  static final CentralDB instance = CentralDB._init();
  CentralDB._init();
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB(databaseName);
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbpath = await getDatabasesPath();
    final path = "$dbpath/$dbName";
    print(path);
    return await openDatabase(path, version: 1, onOpen: _createDB);
  }

  _createDB(Database db) async {
//---------------- Adding Tables ------------------------------
    await db.execute(createTableforDownloadMaster);
  }
}

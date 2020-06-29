import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await open();
    return _database;
  }

  Future<Database> open() async {
    try {
      String dir = await getDatabasesPath();
      dir = join(dir, 'futurist_reminder.db');
      return await openDatabase(
        dir,
        version: 3,
        onCreate: _onCreate,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE Profile ('
        ' id INTEGER PRIMARY KEY autoincrement,'
        ' name TEXT,'
        ' image TEXT);');
    await db.execute('CREATE TABLE Place ('
        ' id INTEGER PRIMARY KEY autoincrement,'
        ' description TEXT,'
        ' location TEXT);');
    await db.execute('CREATE TABLE Helper ('
        ' id INTEGER PRIMARY KEY autoincrement,'
        ' name TEXT,'
        ' description TEXT);');
    await db.execute('CREATE TABLE Place_Helper ('
        ' id_place INTEGER'
        ' id_helper INTEGER);');
    /*
    await db.execute('ALTER TABLE Place_Helper'
        ' ADD FOREIGN KEY FK_PLACE (id_place) REFERENCES Place (id);');
    await db.execute('ALTER TABLE Place_Helper'
        ' ADD FOREIGN KEY FK_HELPER (id_helper) REFERENCES Helper (id);');
    */
  }
}

import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/dependency/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class HelperProvider {
  final DatabaseProvider dbProvider;

  HelperProvider({@required this.dbProvider});

  Future<List<Map<String, dynamic>>> getHelpers() async {
    Database db = await dbProvider.database;
    final result = await db.query(
      'Helper',
    );
    return result;
  }

  Future<bool> saveHelper(Map<String, dynamic> value) async {
    Database db = await dbProvider.database;
    if (value['id'] != null) {
      return await db.update(
            'Helper',
            value,
            where: 'id = ?',
            whereArgs: [value['id']].toList(),
          ) >
          0;
    } else {
      return await db.insert('Helper', value) > 0;
    }
  }

  Future<bool> remove(int id) async {
    Database db = await dbProvider.database;
    return await db.delete(
          'Helper',
          where: 'id = ?',
          whereArgs: [id].toList(),
        ) >
        0;
  }
}

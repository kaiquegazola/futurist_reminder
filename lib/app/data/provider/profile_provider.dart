import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/dependency/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProfileProvider {
  ProfileProvider({@required this.dbProvider});

  final DatabaseProvider dbProvider;

  Future<Map<String, dynamic>> getProfile() async {
    Database db = await dbProvider.database;
    final result =
        await db.query('Profile', where: 'id = ?', whereArgs: [1].toList());
    return result?.first;
  }

  Future<bool> saveProfile(Map<String, dynamic> value) async {
    Database db = await dbProvider.database;
    var result =
        await db.query('Profile', where: 'id = ?', whereArgs: [1].toList());
    if (result.isNotEmpty) {
      return await db.update('Profile', value,
              where: 'id = ?', whereArgs: [1].toList()) >
          0;
    } else {
      value['id'] = 1;
      return await db.insert('Profile', value) > 0;
    }
  }
}

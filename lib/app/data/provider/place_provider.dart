import 'package:flutter/material.dart';
import 'package:futuristreminder/app/data/dependency/database_provider.dart';
import 'package:sqflite/sqflite.dart';

class PlaceProvider {
  final DatabaseProvider dbProvider;

  PlaceProvider({@required this.dbProvider});

  Future<List<Map<String, dynamic>>> getPlaces() async {
    Database db = await dbProvider.database;
    final result = await db.query(
      'Place',
    );
    return result;
  }

  Future<bool> savePlaces(Map<String, dynamic> value) async {
    Database db = await dbProvider.database;
    if (value['id'] != null) {
      return await db.update(
            'Place',
            value,
            where: 'id = ?',
            whereArgs: [value['id']].toList(),
          ) >
          0;
    } else {
      return await db.insert('Place', value) > 0;
    }
  }

  Future<bool> remove(int id) async {
    Database db = await dbProvider.database;
    return await db.delete(
          'Place',
          where: 'id = ?',
          whereArgs: [id].toList(),
        ) >
        0;
  }
}

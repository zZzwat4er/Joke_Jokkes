import 'dart:async';

import 'package:joke_jokkis/utility/joke.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class JokesDB {
  Future<Database>? database;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = openDatabase(
      join(await getDatabasesPath(), 'jokes.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE jokes(id TEXT PRIMARY KEY, value TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertJoke(Joke joke) async {
    if(database == null) await init();
    final db = await database;
    await db!.insert(
      'jokes',
      joke.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Joke>> jokes() async {
    if(database == null) await init();
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('jokes');
    return List.generate(maps.length, (i) {
      return Joke(
        id: maps[i]['id'],
        value: maps[i]['value'],
      );
    });
  }

  Future<void> deleteJoke(String id) async {
    if(database == null) await init();
    final db = await database;
    await db!.delete(
      'jokes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:db_repo/medtile_repo.dart';
import 'utils/medtiles.dart';


class SqliteRepo implements MedTileRepo {
  SqliteRepo._();
  static final SqliteRepo db = SqliteRepo._();
  Database _database;

  Future<Database> get database async {
    if (_database!= null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TherapyDB.db");
    int id = 0;
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE MedTiles ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "dose TEXT,"
          "form TEXT,"
          "doses TEXT,"
          "schedule TEXT,"
          "frequency INTEGER,"
          "start DATETIME"
          ")");
      for(MedTile medTile in medications) {
        await db.rawInsert(
          "INSERT Into MedTiles (id,name,dose,form,doses,schedule,frequency,start)"
          " VALUES (?,?,?,?,?,?,?,?)",
          [id+1, medTile.name, medTile.dose, medTile.form, medTile.doses, 
          medTile.schedule, medTile.frequency, medTile.start]
        );
        id += 1;
      }
    });
  }

  Future<List<MedTile>> medTiles() async {
    final db = await database;
    var res = await db.query("MedTiles");
    List<MedTile> list =
        res.isNotEmpty ? res.map((c) => MedTileEntity.fromMap(c)).toList() : [];
    return list;
  }

  Future<void> addMedTile(MedTile medTile) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM MedTiles");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into MedTiles (id,name,dose,form,doses,schedule,frequency,start)"
        " VALUES (?,?,?,?,?,?,?,?)",
        [id, medTile.name, medTile.dose, medTile.form, medTile.doses, 
          medTile.schedule, medTile.frequency, medTile.start]);
    return raw;
  }

  Future<void> updateMedTile(MedTile medTile) async {
    final db = await database;
    var res = await db.update("MedTiles", medTile.toEntity().toMap(),
        where: "id = ?", whereArgs: [medTile.id]);
    return res;
  }

  Future<void> deleteMedTile(int id) async {
    final db = await database;
    return db.delete("MedTiles", where: "id = ?", whereArgs: [id]);
  }
 }

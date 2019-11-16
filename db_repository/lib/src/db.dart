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
          "start TEXT"
          ")");
      // for(MedTile medTile in medications) {
      //   MedTileEntity entity = medTile.toEntity();
      //   await db.rawInsert(
      //     "INSERT Into MedTiles (id,name,dose,form,doses,schedule,frequency,start)"
      //     " VALUES (?,?,?,?,?,?,?,?)",
      //     [id+1, entity.name, entity.dose, entity.form, entity.doses, 
      //     entity.schedule, entity.frequency, entity.start]
      //   );
      //   id += 1;
      // }
    });
  }

  Future<List<MedTile>> getMedTiles() async {
    final db = await database;
    var result = await db.query("MedTiles");
    List<MedTile> list =
        result.isNotEmpty ? result.map((c) => MedTile.fromEntity(MedTileEntity.fromMap(c))).toList() : [];
    return list;
  }

  addMedTile(MedTile medTile) async {
    final db = await database;
    final MedTileEntity entity = medTile.toEntity();
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM MedTiles");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into MedTiles (id,name,dose,form,doses,schedule,frequency,start)"
        " VALUES (?,?,?,?,?,?,?,?)",
        [id, entity.name, entity.dose, entity.form, entity.doses, 
          entity.schedule, entity.frequency, entity.start]);
    return raw;
  }

  updateMedTile(MedTile medTile) async {
    final db = await database;
    var result = await db.update("MedTiles", medTile.toEntity().toMap(),
        where: "id = ?", whereArgs: [medTile.id]);
    return result;
  }

  deleteMedTileById(int id) async {
    final db = await database;
    return db.delete("MedTiles", where: "id = ?", whereArgs: [id]);
  }
 }

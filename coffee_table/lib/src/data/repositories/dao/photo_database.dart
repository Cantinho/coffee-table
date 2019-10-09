import 'dart:async';
import 'dart:io';

import 'package:coffee_table/src/data/repositories/dao/photo_db_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PhotoDatabase {
  static final PhotoDatabase _instance = PhotoDatabase._();
  static final tableName = "photo";

  static Database _database;

  PhotoDatabase._();

  factory PhotoDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if(_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'database.db');
    var database = openDatabase(dbPath, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $tableName(
        surrogate_id INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT,
        created_at TEXT,
        updated_at TEXT,
        width INTEGER,
        height INT,
        color TEXT,
        description TEXT,
        alt_description TEXT,
        raw_url TEXT,
        full_url TEXT,
        regular_url TEXT,
        small_url TEXT,
        thumb_url TEXT,
        self_link TEXT,
        html_link TEXT,
        download TEXT,
        download_location TEXT,
        likes INTEGER
      )
    ''');
    print('Database was created!');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions.
  }

  Future<int> addPhoto(PhotoDbModel photo) async {
    var client = await db;
    return client.insert('car', photo.toMapForDb(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<PhotoDbModel> fetchPhoto(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query(tableName, where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;

    if(maps.length != 0) {
      return PhotoDbModel.fromDb(maps.first);
    }
    return null;
  }

  Future<List<PhotoDbModel>> fetchAll() async {
    var client = await db;
    var res = await client.query(tableName);

    if(res.isNotEmpty) {
      var photos = res.map((photoMap) => PhotoDbModel.fromDb(photoMap)).toList();
      return photos;
    }
    return [];
  }

  Future<int> updatePhoto(PhotoDbModel newPhoto) async {
    var client = await db;
    return client.update(tableName, newPhoto.toMapForDb(),
    where: 'id = ?', whereArgs: [newPhoto.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removePhoto(int id) async {
    var client = await db;
    return client.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
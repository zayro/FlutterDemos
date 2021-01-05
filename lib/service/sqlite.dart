import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBServicio {
  Database _db;

  Future<Database> get baseDatos async {
    if (_db != null) return _db;

    _db = await init();

    return _db;
  }

  Future<Database> init() async {
    print("init database");
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'client.db');

    return await openDatabase(path, version: 10, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE infoHttp (id INTEGER PRIMARY KEY AUTOINCREMENT, http TEXT)');
      await db.execute(
          'CREATE TABLE infoGeo (id INTEGER PRIMARY KEY AUTOINCREMENT, geo TEXT)');
    });
  }

  //DBServicio() {}

  Future<int> addHttp(data) async {
    print(" ************ addHttp ************");
    print(data);
    final db = await baseDatos;
    int id = await db.rawInsert('INSERT INTO infoHttp(http) VALUES(?)', data);
    return id;
  }

  Future<int> infoGeo(data) async {
    final db = await baseDatos;
    int id = await db.rawInsert('INSERT INTO infoGeo(geo) VALUES(?)', data);
    return id;
  }

  Future<List<dynamic>> findAllHttp() async {
    final db = await baseDatos;
    final res = await db.rawQuery('select  * from infoHttp');

    return res.isNotEmpty ? res : [];
  }

  Future<List<dynamic>> findAllGeo() async {
    final db = await baseDatos;
    final res = await db.rawQuery('select  * from infoGeo');

    return res.isNotEmpty ? res : [];
  }

  Future deleteHttp(id) async {
    final db = await baseDatos;
    return await db.rawDelete('DELETE FROM infoHttp WHERE id = ?', [id]);
  }

  Future deleteAllHttp() async {
    final db = await baseDatos;
    return await db.rawDelete('DELETE FROM infoHttp');
  }

  Future deleteGeo(id) async {
    print("********************");
    print(id);
    print("********************");
    final db = await baseDatos;
    return await db.rawDelete('DELETE FROM infoGeo WHERE id = ?', [id]);
  }

  Future deleteAllGeo() async {
    final db = await baseDatos;
    return await db.rawDelete('DELETE FROM infoGeo');
  }

  void close() async {
// Close the database
    final db = await baseDatos;
    await db.close();
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/persona.dart';

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

    return await openDatabase(path, version: 7, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE person (id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellido TEXT)');
    });
  }

  DBServicio() {}

  Future<int> add(data) async {
    final db = await baseDatos;
    int id = await db.rawInsert(
        'INSERT INTO person(nombre, apellido) VALUES(?, ?)', data);
    return id;
  }

  Future<List<Persona>> findAll() async {
    final db = await baseDatos;
    final res = await db.query('person');

    return res.isNotEmpty ? res.map((s) => Persona.fromJson(s)).toList() : [];
  }

  Future deleteRow(id) async {
    final db = await baseDatos;
    return await db.rawDelete('DELETE FROM person WHERE id = ?', [id]);
  }

  void close() async {
// Close the database
    final db = await baseDatos;
    await db.close();
  }
}

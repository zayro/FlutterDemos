import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBServicioGeneral {
  void init() async {
    //Time
    final date = DateTime.now();

    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    print(databasesPath);
    String path = join(databasesPath, 'demo.db');

// Delete the database
    //await deleteDatabase(path);

// open the database
    Database database = await openDatabase(path, version: 7, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value INTEGER, num REAL, time NUMERIC)');
    });

    var maxIdResult = await database
        .rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Test");

    var id = maxIdResult.first["last_inserted_id"];

    var countRows = await database.rawQuery("SELECT count(*) FROM Test");
    print(countRows);

    // Insert some records

// Insert some records in a transaction
    await database.transaction((txn) async {
      Batch batch = txn.batch();
      int id1 = await txn.rawInsert(
          'INSERT INTO Test( name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(id, name, value, num) VALUES(?, ?, ?, ?)',
          [20, 'another name', 12345678, 3.1416]);
      print('inserted2: $id2');
      batch.commit();
    });

// Update some record
    int count = await database.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');

// Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Test');
    List<Map> expectedList = [
      {'name': 'updated name ', 'id': 1, 'value': 9876, 'num': 456.789},
      {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    ];
    print(list);
    print(expectedList);
    //assert(const DeepCollectionEquality().equals(list, expectedList));

// Count the records
    count = Sqflite.firstIntValue(
        await database.rawQuery('SELECT COUNT(*) FROM Test'));
    //assert(count == 2);

// Delete a record

    count = await database
        .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    assert(count == 1);

// Close the database
    await database.close();
  }
}

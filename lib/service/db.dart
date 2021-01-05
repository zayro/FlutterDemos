/*
import 'package:database/database.dart';
import 'package:database/sql.dart';
import 'package:database_adapter_sqlite/database_adapter_sqlite.dart';

Future main() async {
  final config = SQLite(
    path: './database.db',
  );

  final database = MemoryDatabaseAdapter().database();

  final sqlClient = config.database().sqlClient;

  final result = await sqlClient.rawQuery('SELECT name FROM employee');
  for (var row in result.rows) {
    print('Name: ${row[0]}');
  }
}
*/

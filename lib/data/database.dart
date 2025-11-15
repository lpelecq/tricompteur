import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/counters.dart';
import 'daos/counters_dao.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Counters], daos: [CountersDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'tricompteur_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'), // from https://github.com/simolus3/sqlite3.dart/releases/tag/sqlite3-2.9.4
        driftWorker: Uri.parse('drift_worker.dart.js'), // from https://github.com/simolus3/drift/releases/tag/drift-2.29.0
      ),
    );
  }
}

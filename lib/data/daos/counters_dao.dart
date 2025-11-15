import 'package:drift/drift.dart';

import '../tables/counters.dart';
import '../database.dart';

part 'counters_dao.g.dart';

@DriftAccessor(tables: [Counters])
class CountersDao extends DatabaseAccessor<AppDatabase>
    with _$CountersDaoMixin {
  CountersDao(AppDatabase db) : super(db);

  Future<List<Counter>> getAllCounters() => select(counters).get();

  Stream<List<Counter>> watchCounters() => select(counters).watch();

  Future<int> insertCounter(CountersCompanion counter) =>
      into(counters).insert(counter);

  Future<int> deleteCounter(int id) =>
      (delete(counters)..where((t) => t.id.equals(id))).go();

  Future<int> updateCounterValue(int id, int newValue) {
    return (update(counters)..where((tbl) => tbl.id.equals(id))).write(
      CountersCompanion(value: Value(newValue)),
    );
  }
}

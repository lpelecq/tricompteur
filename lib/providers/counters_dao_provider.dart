import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/daos/counters_dao.dart';
import 'database_provider.dart';

final countersDaoProvider = Provider<CountersDao>((ref) {
  final db = ref.watch(databaseProvider);
  return db.countersDao;
});

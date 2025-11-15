import 'package:drift/drift.dart';

class Counters extends Table {
  late final IntColumn id = integer().autoIncrement()();
  late final TextColumn name = text().withLength(min: 1)();
  late final IntColumn value = integer().check(value.isBiggerOrEqualValue(0))();
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tricompteur/data/database.dart';
import 'package:drift/drift.dart';

import '../data/daos/counters_dao.dart';
import 'counters_dao_provider.dart';

class CountersController extends Notifier<void> {
  late final CountersDao _dao;

  @override
  void build() {
    _dao = ref.read(countersDaoProvider);
  }

  Future<void> createCounter() async {
    await _dao.insertCounter(
      CountersCompanion(name: Value("new counter"), value: Value(0)),
    );
  }

  Future<void> decrementCounter(int id, int oldValue) async {
    if (oldValue > 0) {
      await _dao.updateCounterValue(id, oldValue - 1);
    }
  }

  Future<void> incrementCounter(int id, int oldValue) async {
    await _dao.updateCounterValue(id, oldValue + 1);
  }
}

final countersControllerProvider = NotifierProvider<CountersController, void>(
  () => CountersController(),
);

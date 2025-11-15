import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counters_dao_provider.dart';
import '../data/database.dart';

final countersStreamProvider = StreamProvider.autoDispose<List<Counter>>((ref) {
  final dao = ref.watch(countersDaoProvider);
  return dao.watchCounters();
});

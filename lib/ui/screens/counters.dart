import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/counters_stream_provider.dart';
import '../../providers/counters_controller_provider.dart';

class CountersScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countersAsync = ref.watch(countersStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Counters')),
      body: countersAsync.when(
        data: (counters) => ListView.builder(
          itemCount: counters.length,
          itemBuilder: (_, index) {
            final counter = counters[index];
            return Card(
              child: ListTile(
                title: Text(counter.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${counter.value}', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: counter.value > 0
                          ? () {
                              ref
                                  .read(countersControllerProvider.notifier)
                                  .decrementCounter(counter.id, counter.value);
                            }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        ref
                            .read(countersControllerProvider.notifier)
                            .incrementCounter(counter.id, counter.value);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ref.read(countersControllerProvider.notifier).createCounter(),
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);

  return TaskNotifier(repository);
});

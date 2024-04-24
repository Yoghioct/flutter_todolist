import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/data/datasource/task_datasource_provider.dart';
import 'package:v1project/data/repositories/repositories.dart';
import 'package:v1project/data/repositories/task_repositories_impl.dart';

Provider taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/data/data.dart';

Provider taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});

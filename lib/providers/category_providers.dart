import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/utils/task_categories.dart';

final categoryProvider = StateProvider<TaskCategories>((ref) {
  return TaskCategories.education;
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/app/todo_app.dart';

void main() {
  runApp(ProviderScope(
    child: TodoApp(),
  ));
}

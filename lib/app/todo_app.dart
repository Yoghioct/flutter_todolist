import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/config/config.dart';
import 'package:v1project/config/router/router.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final routeConfig = ref.watch(routeProvider);

    final routeConfig = ref.watch(routeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routeConfig,
      // home: const HomeScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: Text('Hello World'),
      //   ),
      // ),
    );
  }
}

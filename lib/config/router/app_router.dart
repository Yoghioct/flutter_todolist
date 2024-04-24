import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v1project/config/router/router.dart';
import 'package:v1project/screens/screens.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRouter = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];

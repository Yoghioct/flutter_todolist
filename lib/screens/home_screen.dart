import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:v1project/config/router/router.dart';
import 'package:v1project/data/models/models.dart';
import 'package:v1project/providers/providers.dart';
import 'package:v1project/utils/utils.dart';
import 'package:v1project/widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final now = DateTime.now();
    final taskState = ref.watch(taskProvider);
    final completedTask = _completedTask(taskState.tasks, ref);
    final incompletedTask = _incompletedTask(taskState.tasks, ref);

    return Scaffold(
      // appBar: AppBar(),

      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      // text: '16 April 2024',
                      text: DateFormat('dd MMMM yyyy').format(now),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    const DisplayWhiteText(
                      text: 'To Do List',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 130, // Adjust the top position as needed
            left: 0, // Adjust the top position as needed
            right: 0, // Adjust the top position as needed
            bottom: MediaQuery.of(context)
                .padding
                .bottom, // Margin from bottom of safe area

            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListTask(
                      // tasks: taskState.tasks,
                      tasks: incompletedTask,
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineSmall,
                    ),
                    const Gap(20),
                    DisplayListTask(
                      // tasks: taskState.tasks,
                      tasks: completedTask,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: DisplayWhiteText(
                            text: 'Add New Task',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _incompletedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        // final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        // if (isTaskDay) {
        filteredTask.add(task);
      }
      // }
    }
    return filteredTask;
  }

  List<Task> _completedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        // final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        // if (isTaskDay) {
        filteredTask.add(task);
      }
      // }
    }
    return filteredTask;
  }
}

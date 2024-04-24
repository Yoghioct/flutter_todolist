import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/data/data.dart';
import 'package:v1project/providers/providers.dart';
import 'package:v1project/utils/app_alerts.dart';
import 'package:v1project/utils/utils.dart';
import 'package:v1project/widgets/widgets.dart';

class DisplayListTask extends ConsumerWidget {
  const DisplayListTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage = isCompletedTasks
        ? 'There is no completed task yet'
        : 'There is no task to do';

    return TodoListContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.titleSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              itemCount: tasks.length,
              itemBuilder: (val, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(
                      context,
                      ref,
                      task,
                    );
                    // todo delete
                  },
                  onTap: () async {
                    // todo detail
                    await showModalBottomSheet(
                        context: context,
                        builder: (val) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskList(
                      task: task,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(task)
                            .then((value) {
                          AppAlerts.displaySnackBar(
                              context,
                              task.isCompleted
                                  ? 'Task incompleted'
                                  : 'Task completed');
                        });
                      }),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 0.5,
                );
                // return Gap(20);
              },
            ),
    );
  }
}

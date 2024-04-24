import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/data/models/task.dart';
import 'package:v1project/providers/providers.dart';
import 'package:v1project/utils/utils.dart';
import 'package:go_router/go_router.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.surface,
            )),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: const Text('Cancel'),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          context.pop();
          AppAlerts.displaySnackBar(context, "Task delete successfully!");
        });
        print('aaa');
      },
      child: const Text('Yes'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure, you want to delete this task?'),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
        context: context,
        builder: (ctx) {
          return alert;
        });
  }
}

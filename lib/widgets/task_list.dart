import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:v1project/data/data.dart';
import 'package:v1project/widgets/widgets.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.task,
    this.onCompleted,
  });

  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final opacityBackgroundIcon = task.isCompleted ? 0.4 : 1.0;
    final textList = task.isCompleted ? Colors.black87 : Colors.black;

    return Row(
      children: [
        CircleContainer(
          color: task.category.color.withOpacity(opacityBackgroundIcon),
          child: Center(
            child: Icon(
              task.category.icon,
              color: Colors.white,
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textList,
                  )),
              Text(
                task.time + ' ' + task.date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        Checkbox(
          value: task.isCompleted,
          onChanged: onCompleted,
        )
      ],
    );
  }
}

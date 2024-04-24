import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:v1project/data/data.dart';
import 'package:v1project/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final opacityBackgroundIcon = task.isCompleted ? 0.4 : 1.0;
    final textList = task.isCompleted ? Colors.black87 : Colors.black;
    final isComplete = task.isCompleted ? Colors.green : Colors.amber;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Text('Details'),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 5), // Adjust padding as needed
              decoration: BoxDecoration(
                color: isComplete.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                    10), // Adjust border radius for rounded corners
              ),
              child: Text(
                task.isCompleted ? 'Completed' : 'Waiting',
                style: TextStyle(
                  color: isComplete,
                  fontSize: 12,
                ), // Set text color to white
              ),
            ),
          ),
          const Gap(15),

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
          const Gap(15),
          Container(
            child: task.note.isEmpty
                ? const SizedBox(height: 0)
                : TextFormField(
                    initialValue: task.note,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                    maxLines: null,
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Note',
                      border: OutlineInputBorder(),
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    ),
                  ),
            // task.note.isEmpty ? '' : '';
            // child: TextFormField(
            //   initialValue: task.note,
            // ),
          ),
        ],
      ),
    );
  }
}

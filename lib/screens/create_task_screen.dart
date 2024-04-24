import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:v1project/config/router/router.dart';
import 'package:v1project/data/models/task.dart';
import 'package:v1project/providers/providers.dart';
import 'package:v1project/utils/app_alerts.dart';
import 'package:v1project/utils/utils.dart';
import 'package:v1project/widgets/common_text_field.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v1project/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'Add new task',
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                labelText: 'Task title',
                controller: _titleController,
              ),
              const SelectCategory(),
              const Gap(18),
              Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      // labelText: 'Date',
                      hintText: DateFormat('dd MMMM yyyy').format(date),
                      // hintText: "$now",
                      readOnly: true,
                      suffixIcon: IconButton(
                        onPressed: () => _selectDate(context, ref),
                        icon: Icon(Ionicons.time),
                      ),
                    ),
                  ),
                  const Gap(18),
                  Expanded(
                    child: CommonTextField(
                      // labelText: 'Time',
                      // hintText: DateFormat('HH:mm').format(time),
                      hintText: Helper.timeToString(time),
                      readOnly: true,
                      suffixIcon: IconButton(
                        onPressed: () => _selectTime(context, ref),
                        icon: Icon(Ionicons.calendar),
                      ),
                    ),
                  ),
                ],
              ),
              CommonTextField(
                labelText: 'Note',
                maxLines: 6,
                controller: _noteController,
              ),
              // Gap(30),
              ElevatedButton(
                onPressed: _createTask,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: DisplayWhiteText(
                    text: 'Save',
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isEmpty) {
      // print('empty title');
      AppAlerts.displaySnackBar(context, 'Task title cannot be empty!');
    } else {
      final task = Task(
        title: title,
        note: note,
        time: Helper.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        category: category,
        isCompleted: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(context, 'Task created successfully!');
        context.go(RouteLocation.home);
      });
    }
  }
}

void _selectTime(BuildContext context, WidgetRef ref) async {
  final initialTime = ref.read(timeProvider);

  try {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      // initialTime: TimeOfDay.now(),
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  } catch (e) {
    print('Error: $e');
  }
}

void _selectDate(BuildContext context, WidgetRef ref) async {
  final initiateDate = ref.read(dateProvider);

  try {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      // initialDate: DateTime.now(),
      initialDate: initiateDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  } catch (e) {
    print('Error: $e');
  }
}

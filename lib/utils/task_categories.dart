import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum TaskCategories {
  education(Ionicons.school, Colors.blueGrey),
  health(Ionicons.heart, Colors.orange),
  home(Ionicons.home, Colors.green),
  others(Ionicons.calendar, Colors.purple),
  personal(Ionicons.person, Colors.lightBlue),
  shopping(Ionicons.bag, Colors.blue),
  social(Ionicons.people, Colors.pink),
  travel(Ionicons.airplane, Colors.deepOrange),
  work(Ionicons.business, Colors.amber);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IoniconsData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);
}

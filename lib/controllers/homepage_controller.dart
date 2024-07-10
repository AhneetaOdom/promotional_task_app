import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../widgets/reusable_widgets/task.dart';

class HomePageController extends GetxController {
  final _taskList = <Task>[].obs;

  List<Task> get taskList => _taskList;
  TextEditingController? titleEditingController, desEditingController;

  @override
  void onInit() {
    super.onInit();
    titleEditingController = TextEditingController();
    desEditingController = TextEditingController();
  }

  @override
  void dispose() {
   
    super.dispose();
    titleEditingController!.clear();
    desEditingController!.clear();
  }

  void addTask() {
    String text1 = titleEditingController!.text;
    String text2 = desEditingController!.text;
    DateTime time = DateTime.now();

   _taskList.add(Task(
      text1,
      text2,
      time.day.toString(),
      completed:false
      
    ));
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }

  void editTask(Task task) {}

 // total completed count
  void toggleTaskCompletion(Task task) {
    task.completed = !task.completed;
    _taskList.refresh();
  }

  int noOfCompletedTask() {
    int count = 0;
    for (final task in _taskList) {
      if (task.completed) {
        count++;
      }
    }
    return count;
  }
}

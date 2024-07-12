import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../widgets/reusable_widgets/task.dart';

class HomePageController extends GetxController {
  final _taskList = <Task>[].obs;
   String time = DateFormat.yMMMEd().format(DateTime.now());

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
   
     _taskList.add(Task(
        taskTitle: text1,
        taskDescription: text2,
        taskCreated: time,
        completed: false));
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }

  void editTask(int taskIndex) {
    //###
    taskList[taskIndex] = Task(
        taskTitle: titleEditingController!.text,
        taskDescription: desEditingController!.text,
        taskCreated: taskList[taskIndex].taskCreated,
        completed: taskList[taskIndex].completed);
    //###
  }

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

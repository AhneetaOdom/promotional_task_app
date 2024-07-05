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

    taskList.add(Task(
      text1,
      text2,
      time.day.toString(),
    ));
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }

  void editTask(Task task) {}
}

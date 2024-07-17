import 'package:flutter/material.dart';
import 'package:promotional_task3/utils/constants/size.dart';

class TaskDetails extends StatelessWidget {
  final String textName;
  final String textDescription;
  final String time;
  final bool taskCompleted;

  const TaskDetails({
    super.key,
    required this.textName,
    required this.textDescription,
    required this.time,
    required this.taskCompleted,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        // leading: Icon(Icons.arrow_left_rounded),
        title: const Text('Title Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Task Created: ',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightNormal),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Task Title: ',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  Text(
                    textName,
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightNormal),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Task Description: ',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  Text(
                    textDescription,
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightNormal),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Task Completed: ',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightBold),
                  ),
                  Text(
                    taskCompleted ? 'Done' : 'Undone',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeMd,
                        fontWeight: AppSize.fontWeightNormal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

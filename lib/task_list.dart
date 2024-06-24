import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TaskList extends StatelessWidget {
  const TaskList(
      {super.key,
      required this.text1,
      required this.text2,
      required this.taskCompleted,
      required this.onChanged,
      required this.onDelete,
      required this.onEdit,
      required this.taskInfo});

  final String text1;
  final String text2;
  final bool taskCompleted;
  final List taskInfo;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete_outline,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            SlidableAction(
              onPressed: onEdit,
              backgroundColor: Colors.grey,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Container(
          width: 327,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskInfo[0],
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

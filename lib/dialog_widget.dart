import 'package:flutter/material.dart';
import 'package:promotional_task3/dialog_button.dart';
class DialogWidget extends StatefulWidget {
  const DialogWidget(
      {super.key,
      required this.onSave,
      required this.onCancel,
      this.onEdit,
      required this.controller1,
      required this.controller2,
      this.editMode = false,
      this.taskInfo});

  final VoidCallback onSave;
  final List? taskInfo;
  final VoidCallback onCancel;
  final VoidCallback? onEdit;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final bool editMode;
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  void initState() {
    if (widget.editMode) {
      widget.controller1.text = widget.taskInfo![0];
      widget.controller2.text = widget.taskInfo![1];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content:Container(
        height: 210,
        child: Column(
          children: [
            TextField(
              controller: widget.controller1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Create a Task Title'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: widget.controller2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Create a Task'),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(
                  text: 'Save',
                  onPressed: widget.editMode ? widget.onEdit : widget.onSave,
                ),
                const SizedBox(
                  width: 10,
                ),
                DialogButton(
                  text: 'Cancel',
                  onPressed: widget.onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}




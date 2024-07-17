import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promotional_task3/controllers/homepage_controller.dart';

import 'package:promotional_task3/utils/constants/size.dart';
import 'package:promotional_task3/widgets/reusable_widgets/dialog_button.dart';

class AddTask extends StatelessWidget {
  AddTask({
    super.key,
    //###
    this.editMode,
    this.taskIndex,
    //###
  });
  final HomePageController controller = Get.put(HomePageController());
  //###
  final bool? editMode;
  final int? taskIndex;
  //###

  @override
  Widget build(BuildContext context) {
    //###
    controller.desEditingController!.text =
        editMode == null ? "" : controller.taskList[taskIndex!].taskDescription;
    controller.titleEditingController!.text =
        editMode == null ? "" : controller.taskList[taskIndex!].taskTitle;
//###
    return Column(
      children: [
        TextField(
          // controller: TextEditingController(),
          controller: controller.desEditingController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),

              //####
              hintText: /*### */
                  editMode != null ? "" : /*### */ 'Enter the Task Title'),
        ),
        const SizedBox(
          height: AppSize.defaultSpace,
        ),
        TextField(
          controller: controller.titleEditingController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: /*### */
                  editMode != null
                      ? ""
                      : /*### */ 'Enter the Task Description'),
        ),
        const SizedBox(
          height: AppSize.mediumDefaultSpace,
        ),
        const SizedBox(
          height: AppSize.mediumDefaultSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DialogButton(
                text: /*### */
                    editMode != null ? "Update" : /*### */ 'Save',
                onPressed: () {
                  if (controller.desEditingController!.text.isEmpty ||
                      controller.titleEditingController!.text.isEmpty) return;
                  /*### */
                  editMode != null
                      ? controller.editTask(taskIndex!)
                      : /*### */ controller.addTask();
                  controller.titleEditingController?.clear();
                  controller.desEditingController?.clear();
                  Get.back();
                }),
            const SizedBox(
              width: 10,
            ),
            DialogButton(
                text: 'Cancel',
                onPressed: () {
                  controller.titleEditingController?.clear();
                  controller.desEditingController?.clear();
                  Get.back();
                })
          ],
        )
      ],
    );
  }
}

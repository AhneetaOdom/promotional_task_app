import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promotional_task3/controllers/homepage_controller.dart';
import 'package:promotional_task3/utils/constants/size.dart';
import 'package:promotional_task3/widgets/reusable_widgets/dialog_button.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          // controller: TextEditingController(),
          controller: controller.desEditingController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter the Task Title'),
        ),
        const SizedBox(
          height: AppSize.defaultSpace,
        ),
        TextField(
          controller: controller.titleEditingController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the Task Description'),
        ),
        const SizedBox(
          height: AppSize.mediumDefaultSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DialogButton(
                text: 'Save',
                onPressed: () {
                  controller.addTask();
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

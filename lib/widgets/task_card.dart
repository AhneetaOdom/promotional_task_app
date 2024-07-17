import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotional_task3/screens/task_details.dart';

import '../controllers/homepage_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/size.dart';
import 'reusable_widgets/addtask_dialog_widget.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.textName,
    required this.textDescription,
    required this.time,
    required this.press,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String textName, textDescription, time;
  final VoidCallback press;
  final Function(bool?)? onChanged;
  final bool taskCompleted;

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.mediumDefaultSpace),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Checkbox(value: taskCompleted, onChanged: onChanged),
                    // child: Container(
                    //   height: 25,
                    //   width: 25,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: primaryColor, width: 1.5),
                    //       shape: BoxShape.circle),
                    // ),
                  ),
                  const SizedBox(
                    width: AppSize.smallDefaultSpace,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                            Get.to(TaskDetails(
                              textName: textName,
                              textDescription: textDescription,
                              time: time,
                              taskCompleted: taskCompleted));
                        },
                        child: Text(
                          time,
                          style: TextStyle(
                              fontSize: AppSize.fontSizeXs,
                              fontWeight: AppSize.fontWeightNormal,
                              color: grey50),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(TaskDetails(
                              textName: textName,
                              textDescription: textDescription,
                              time: time,
                              taskCompleted: taskCompleted));
                        },
                        child: Text(
                          textName,
                          style: const TextStyle(
                              fontSize: AppSize.fontSizeXs,
                              fontWeight: AppSize.fontWeightNormal,
                              color: grey),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                           Get.to(TaskDetails(
                              textName: textName,
                              textDescription: textDescription,
                              time: time,
                              taskCompleted: taskCompleted));
                        },
                        child: Text(
                          textDescription,
                          style: const TextStyle(
                              fontSize: AppSize.fontSizeSm,
                              fontWeight: AppSize.fontWeightBold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          content: SizedBox(
                        width: 350,
                        //###
                        child: AddTask(
                          editMode: true,
                          taskIndex: 0,
                        ), //###
                      ));
                    },
                    child: const Icon(
                      Icons.edit_note_outlined,
                      color: grey,
                    ) /* Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.edit_note_outlined,
                        color: grey,
                      ),
                    ) */
                    ,
                  ),
                  const SizedBox(
                    width: AppSize.smallDefaultSpace,
                  ),
                  GestureDetector(
                    onTap: press,
                    child: const Icon(
                      Icons.delete_outlined,
                      color: grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

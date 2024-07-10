import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promotional_task3/controllers/homepage_controller.dart';
import 'package:promotional_task3/utils/constants/colors.dart';
import 'package:promotional_task3/utils/constants/size.dart';
import 'package:promotional_task3/widgets/reusable_widgets/addtask_dialog_widget.dart';
import 'package:promotional_task3/widgets/reusable_widgets/home_container.dart';

import '../widgets/task_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.defaultDialog(
              content: Container(
            width: 350,
            child: AddTask(),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_outlined), label: 'Note'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: grey,
        unselectedLabelStyle: const TextStyle(color: grey),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '2024,Feb. 17',
                  style: TextStyle(color: grey50, fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hola, Martin👋',
                    style: TextStyle(
                        fontSize: AppSize.fontSizeLg,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: grey50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: grey50,
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Obx(() => HomeContainer(
                          total: controller.taskList.length,
                          text1: '📦',
                          text2: 'Total Number of Tasks',
                        )),
                    Obx(() => HomeContainer(
                          total: controller.noOfCompletedTask(),
                          text1: '🙌',
                          text2: 'Total Number of Completed Tasks',
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                  const Text(
                    ' All Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.taskList.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                          textName: controller.taskList[index].taskTitle,
                          textDescription:
                              controller.taskList[index].taskDescription,
                          time: controller.taskList[index].taskCreated,
                          press: () {
                            controller.deleteTask(controller.taskList[index]);
                          },
                          onChanged: (bool? value) {
                            controller.toggleTaskCompletion(
                                controller.taskList[index]);
                          }, taskCompleted: controller.taskList[index].completed,);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

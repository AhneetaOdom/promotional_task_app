import 'package:flutter/material.dart';
import 'package:promotional_task3/dialog_widget.dart';
import 'package:promotional_task3/home_container.dart';
import 'package:promotional_task3/overlay_widget.dart';
import 'package:promotional_task3/task_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  List taskList = [
    ['Task1', 'Create an onboarding page', false],
    ['Task2', 'Create a home page', true]
  ];

  // toggle checkbox
  void toggleTaskCompletion(int index, bool? value) {
    setState(() {
      taskList[index][2] = !taskList[index][2];
    });
  }

//total completed count
  int noOfCompletedTask(taskList) {
    int count = 0;
    for (final list in taskList) {
      if (list[2]) {
        count++;
      }
    }
    return count;
  }

  //save Task
  void saveTask() {
    setState(() {
      taskList.add([_controller1.text, _controller2.text, false]);
      _controller1.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
  }

  void onEditTask(taskIndex, text1, text2) {
    setState(() {
      taskList[taskIndex][0] = text1;
      taskList[taskIndex][1] = text2;
      _controller1.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
  }

  //delete Task
  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  //create Task
  void createTask({bool editMode = false, List? taskInfo, int? taskIndex}) {
    showDialog(
        context: context,
        builder: (context) {
          return DialogWidget(
            taskInfo: taskInfo,
            editMode: editMode,
            onEdit: () {
              onEditTask(taskIndex, _controller1.text, _controller2.text);
            },
            controller1: _controller1,
            controller2: _controller2,
            onSave: () {
              saveTask();
              Navigator.of(context).pop();
            },
            onCancel: () {},
          );
        });
  }

//full homepage dialog
  void showFullScreenDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.8),
          body: Stack(
            children: [
              //cancel dialog screen
              Positioned(
                bottom: 120,
                right: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.cancel_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),

// create new task
              Positioned(
                  bottom: 230,
                  right: 24,
                  child: GestureDetector(
                    onTap: () {
                      createTask();
                    },
                    child: const Create(
                      text: 'Create Task',
                      iconss: Icons.check_circle_outline_rounded,
                    ),
                  )),

              //create new project
              const Positioned(
                bottom: 160,
                right: 24,
                child: Create(
                  text: 'Create Project',
                  iconss: Icons.note_add_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 79, 121, 192),
        onPressed: () {
          showFullScreenDialog(context);
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
        selectedItemColor: const Color.fromARGB(255, 79, 121, 192),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
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
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hola, Martin👋',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.notifications_none,
                      color: Colors.grey.shade600,
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeContainer(
                    total: taskList.length,
                    text1: '📦',
                    text2: 'Total Number of Tasks',
                  ),
                  HomeContainer(
                    total: noOfCompletedTask(taskList),
                    text1: '🙌',
                    text2: 'Total Number of Completed Tasks',
                  ),
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
                    color: Color.fromARGB(255, 79, 121, 192),
                  ),
                ),
                const Text(
                  ' All Tasks',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      return TaskList(
                        taskInfo: taskList[index],
                        text1: taskList[index][0],
                        text2: taskList[index][1],
                        taskCompleted: taskList[index][2],
                        onChanged: (value) {
                          toggleTaskCompletion(index, value);
                        },
                        onDelete: (BuildContext) {
                          (value) => deleteTask(index);
                        },
                        onEdit: (BuildContext) {
                          createTask(
                              editMode: true,
                              taskInfo: taskList[index],
                              taskIndex: index);
                        },
                      );
                    }))
          ],
        ),
      )),
    );
  }
}

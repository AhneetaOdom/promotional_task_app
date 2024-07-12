class Task {
  String taskTitle;
  String taskDescription;
  String taskCreated;
  bool completed;

  Task({required this.taskTitle, required this.taskDescription, required this.taskCreated, this.completed = false,} );
}

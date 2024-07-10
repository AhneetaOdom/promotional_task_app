class Task {
  String taskTitle;
  String taskDescription;
  String taskCreated;
  bool completed;

  Task(this.taskTitle, this.taskDescription, this.taskCreated, {this.completed = false} );
}

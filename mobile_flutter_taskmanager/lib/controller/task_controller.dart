import '../model/task.dart';

class TaskController {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _tasks.add(Task(title: title));
  }

  void toggleComplete(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}

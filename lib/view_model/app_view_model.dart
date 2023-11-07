import 'package:flutter/material.dart';
import '../models/task_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];

  int get tasksNum => tasks.length;
  int get remainingTasksNum => tasks.where((task) => !task.completed).length;
  int get completedTasksNum => tasksNum - remainingTasksNum;

  bool isRepeated(String txt) {
    for (int i = 0; i < tasks.length; i++) {
      if (txt == tasks[i].title) {
        return true;
      }
    }
    return false;
  }

  addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
    print(tasks);
  }

  removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  editTask(int index, String txt) {
    tasks[index].title = txt;
    notifyListeners();
  }

  SetTaskStatus(int index, value) {
    tasks[index].completed = value;
    notifyListeners();
  }

  taskStatus(int index) {
    tasks[index].completed;
  }

  rebuild() {
    notifyListeners();
  }

  void buildBottomSheet(BuildContext context, Widget bottomSheet) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) {
          return bottomSheet;
        }),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            //  bottomLeft: Radius.circular(10),
            //  bottomRight: Radius.circular(10),
          ),
        ));
  }
}

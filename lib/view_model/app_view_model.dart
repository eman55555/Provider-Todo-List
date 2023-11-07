import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants/colors.dart';
import '../models/task_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];

  int get tasksNum => tasks.length;

  var tasksBox = Hive.box(keyTasksBox);
  int get tasksNumLocal => tasksBox.length;
  int get remainingTasksNumLocal =>
      tasksBox.values.where((task) => !task.completed).length;
  int get completedTasksNumLocal => tasksNumLocal - remainingTasksNumLocal;

  bool isRepeatedLocal(String txt) {
    for (int i = 0; i < tasksBox.values.toList().length; i++) {
      if (txt == tasksBox.values.toList()[i].title) {
        return true;
      }
    }

    // tasksBox.values.where((element) => element.title.contains(txt.toLowerCase()));

    return false;
  }

  SetTaskStatusLocal(int index, value) {
    tasksBox.getAt(index).completed = value;
    notifyListeners();
  }

  rebuild() {
    notifyListeners();
  }

  saveTasksLocal(Task task) async {
    try {
      await tasksBox.add(task);
    } catch (e) {
      print(e.toString());
    }
  }

  retrieveTasksLocal() {
    tasksBox.get(keyTasksBox);
  }

  deleteTasksLocal(int index) {
    tasksBox.deleteAt(index);
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

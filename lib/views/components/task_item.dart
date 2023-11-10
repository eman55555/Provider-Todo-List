import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../models/task_model.dart';
import '../../view_model/app_view_model.dart';

class TaskItem extends StatelessWidget {
  final String txt;
  final bool completed;
  final Function() remove;
  final Function() edit;
  final int index;
  final AppViewModel viewmodel;

  TaskItem({
    super.key,
    required this.txt,
    required this.index,
    required this.viewmodel,
    required this.edit,
    required this.remove,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Row(
          children: [
            Transform.scale(
              //scale: 1.9,
              scaleX: 1.4,
              scaleY: 1.6,
              child: Checkbox(
                  activeColor: brown,
                  checkColor: lightBlack,
                  value: completed,
                  onChanged: (value) {
                    viewmodel.tasksBox.putAt(index, Task(txt, value!));
                    viewmodel.rebuild();
                  }),
            ),
            Text(
              txt,
              style: TextStyle(
                fontSize: 23,
                color: lightBlack,
                // fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: remove,
                iconSize: 33,
                icon: const Icon(Icons.delete),
                color: lightBlack),
            IconButton(
                onPressed: edit,
                iconSize: 30,
                icon: const Icon(Icons.edit),
                color: lightBlack),
          ],
        ),
      ),
    );
  }
}

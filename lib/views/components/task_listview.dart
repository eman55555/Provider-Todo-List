import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../view_model/app_view_model.dart';
import 'bootom_sheets/add_bottom_sheet.dart';
import 'task_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      viewModel.tasksBox.get(keyTasksBox);

      return viewModel.tasksBox.isEmpty
          ? Center(
              child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              color: lightBlue,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Text(
                    'You have not any Tasks 😁',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ))
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                var box = viewModel.tasksBox.getAt(index);

                return TaskItem(
                  txt: box.title,
                  index: index,
                  viewmodel: viewModel,
                  edit: () {
                    viewModel.buildBottomSheet(
                        context,
                        AddBottomSheet(
                          edit: true,
                          index: index,
                          title: box.title,
                          complete: box.completed,
                        ));
                  },
                  remove: () {
                    viewModel.deleteTasksLocal(index);
                  },
                  completed: box.completed,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
              itemCount: viewModel.tasksBox.length);
    });
  }
}

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
      return viewModel.tasks.isEmpty
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
                return TaskItem(
                  txt: viewModel.tasks[index].title,
                  index: index,
                  viewmodel: viewModel,
                  edit: () {
                    viewModel.buildBottomSheet(
                        context,
                        AddBottomSheet(
                          edit: true,
                          index: index,
                          title: viewModel.tasks[index].title,
                          complete: viewModel.tasks[index].completed,
                        ));
                  },
                  remove: () {
                    viewModel.removeTask(index);
                  },
                  completed: viewModel.tasks[index].completed,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 20),
              itemCount: viewModel.tasks.length);
    });
  }
}

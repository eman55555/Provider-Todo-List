import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../view_model/app_view_model.dart';
import 'components/task_info.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: brown,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: lightBlack,
            title: Text(
              "Dashboard",
              style: TextStyle(color: brown),
            )),
        body: Consumer<AppViewModel>(builder: (context, viewmodel, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              taskInfoHeader("Total Tasks"),
              taskInfoDetails(viewmodel.tasksNum.toString()),
              taskInfoHeader("Completed Tasks"),
              taskInfoDetails(viewmodel.completedTasksNum.toString()),
              taskInfoHeader("Non-Completed Tasks"),
              taskInfoDetails(viewmodel.remainingTasksNum.toString()),
            ],
          );
        }));
  }
}

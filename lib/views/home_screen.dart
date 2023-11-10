import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../view_model/app_view_model.dart';
import 'components/add_task_button.dart';
import 'components/app_bar_container.dart';
import 'components/task_listview.dart';
import 'dashboard_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown,
      appBar: AppBar(
        elevation: 0,
        title:  Consumer<AppViewModel>(
      
      builder: (context, viewModel, child) {
          return Text(
            "Welcome, ${viewModel.username}",
            style: TextStyle(color: brown),
          );
      }
        ),
        backgroundColor: lightBlack,
        leading: AppBarContainer(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
          },
          txt: "D",
        ),
        actions: [
          AppBarContainer(
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            txt: "P",
          )
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        Expanded(flex: 3, child: TaskListView()),
        const SizedBox(
          height: 90,
        )
      ]),
      floatingActionButton: AddTaskButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

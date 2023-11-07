import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../view_model/app_view_model.dart';
import 'bootom_sheets/add_bottom_sheet.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: lightBlack,
                foregroundColor: brown,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              viewModel.buildBottomSheet(
                  context,
                  AddBottomSheet(
                    edit: false,
                    complete: false,
                  ));
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ));
    });
  }
}

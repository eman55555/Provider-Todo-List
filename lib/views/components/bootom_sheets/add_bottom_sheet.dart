import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../models/task_model.dart';
import '../../../view_model/app_view_model.dart';
import '../text_button.dart';
import '../text_form_field.dart';

class AddBottomSheet extends StatelessWidget {
  final bool edit;
  final int index;
  final String title;
  final bool complete;
  AddBottomSheet(
      {super.key,
      required this.edit,
      this.index = 0,
      this.title = "",
      required this.complete});

  @override
  Widget build(context) {
    TextEditingController txtController = TextEditingController();
    txtController.text = title;

    return SingleChildScrollView(
      child: Container(
        color: brown,
        child: Padding(
          padding: EdgeInsets.only(
              top: 8, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 25, bottom: 18),
                child: Container(
                    child: textField(
                  "Task Name",
                  txtController,
                  Icon(
                    Icons.note,
                    color: lightBlack,
                  ),
                  TextInputType.text, false,
                  //false
                )),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      right: 18, left: 18, bottom: 10, top: 5),
                  child: Consumer<AppViewModel>(
                      builder: (context, viewModel, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButtonView(
                          pad: 15,
                          font: 17,
                          press: () {
                            Navigator.pop(context);
                          },
                          txt: "Cancel",
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        TextButtonView(
                          pad: 15.0,
                          font: 17,
                          press: () {
                            if (txtController.text.isNotEmpty) {
                              if (edit == true) {
                                if (viewModel
                                        .isRepeatedLocal(txtController.text) ==
                                    false) {
                                  viewModel.tasksBox.putAt(index,
                                      Task(txtController.text, complete));

                                  viewModel.rebuild();
                                }

                                txtController.clear();
                                Navigator.pop(context);
                              } else {
                                if (viewModel
                                        .isRepeatedLocal(txtController.text) ==
                                    false) {
                                  Task task =
                                      Task(txtController.text, complete);

                                  viewModel.tasksBox.add(task);
                                  viewModel.rebuild();
                                }

                                txtController.clear();
                                Navigator.pop(context);
                              }
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          txt: "Save",
                        )
                      ],
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

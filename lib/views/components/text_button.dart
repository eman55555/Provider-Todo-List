import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TextButtonView extends StatelessWidget {
  final txt;
  final Function() press;

  const TextButtonView({super.key, required this.press, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: lightBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              foregroundColor: brown,
              backgroundColor: lightBlack),
          onPressed: press,
          child: Text(
            txt,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}

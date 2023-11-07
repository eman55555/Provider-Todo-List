import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppBarContainer extends StatelessWidget {
  final String txt;
  final Function() press;

  const AppBarContainer({super.key, required this.press, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      width: 45,
      decoration: BoxDecoration(
          color: brown,
          border: Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
        onPressed: press,
        child: Text(
          txt,
          style: TextStyle(
              color: lightBlack, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

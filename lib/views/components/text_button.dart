import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TextButtonView extends StatelessWidget {
  final txt;
  final Function() press;
  double? font = 19.0;
  double? pad = 18.0;
  TextButtonView(
      {super.key, required this.press, required this.txt, this.pad, this.font});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: pad!,
              ),
              foregroundColor: brown,
              backgroundColor: lightBlack),
          onPressed: press,
          child: Text(
            txt,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: font),
          )),
    );
  }
}

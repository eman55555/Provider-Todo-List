import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget userInfoHeader(String txt, Widget widget) => Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 12, left: 5, right: 5),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: lightBlue,
    ),
    child: Row(
      children: [
        widget,
        SizedBox(
          width: 8,
        ),
        Text(
          txt,
          style: TextStyle(
              fontSize: 20, color: lightBlack, fontWeight: FontWeight.bold),
        ),
      ],
    ));

Widget userInfoDetails(String txt) => Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: lightBlue,
    ),
    child: Text(
      txt,
      style: TextStyle(fontSize: 20, color: brown, fontWeight: FontWeight.bold),
    ));

 makeSnackBar(BuildContext context, String txt, Color color ) {
  var snackBar = SnackBar(
    content: Text(
      txt,
      style: TextStyle(fontSize: 15),
    ),
    backgroundColor: color,
  );
  return ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}

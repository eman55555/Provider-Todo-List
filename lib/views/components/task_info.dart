import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget taskInfoHeader(String txt) => Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: lightBlack,
    ),
    child: Center(
      child: Text(
        txt,
        style: TextStyle(fontSize: 22, color: brown),
      ),
    ));

Widget taskInfoDetails(String txt) => Center(
      child: Container(
          width: 200,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: lightBlue,
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: 20, color: brown, fontWeight: FontWeight.bold),
            ),
          )),
    );

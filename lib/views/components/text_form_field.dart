import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget textField(String hint, TextEditingController txt) => TextFormField(
    controller: txt,
    cursorColor: black,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: black),
      ),
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: black),
      ),
    ));

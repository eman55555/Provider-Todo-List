import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget textField(
  String hint,
  TextEditingController txt,
  Widget widget,
  TextInputType type,
  bool obscure,
  //bool isEmail
) =>
    TextFormField(
        controller: txt,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: black,
        keyboardType: type,
        inputFormatters: [],
        validator: (value) {
          //   if (isEmail == true  && (value!.isEmpty|| !value.contains("@") || !value.contains(".")))
          //   {

          //                   return "Please Fill correctly";

          // }

          if (value!.isEmpty) {
            return "Please Fill correctly";
          }
          return null;
        },
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: widget,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: black),
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: black),
          ),
        ));

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

Widget textField(
  String hint,
  TextEditingController txt,
  Widget widget,
  TextInputType type,
  bool obscure,
  List<TextInputFormatter> formatter
  //bool isEmail
) =>
    TextFormField(
      
        controller: txt,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: black,
        keyboardType: type,

        inputFormatters: formatter,
        validator: (value) {
          
          //   if (isEmail == true  && (value!.isEmpty|| !value.contains("@") || !value.contains(".")))
          //   {

          //                   return "Please Fill correctly";

          // }

          if (value!.isEmpty) {
            return "Please Fill correctly";
          }
          else if( value.length < 2 ) {
            return "must be greater than two characters";
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

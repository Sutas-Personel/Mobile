import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/colors.dart';

class InputWidget extends StatelessWidget {
  String title;
  var contoller = TextEditingController();
  Function valid;
  bool passwordType;

  InputWidget(this.contoller, this.title, this.valid, this.passwordType);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contoller,
      obscureText: passwordType,
      validator: valid,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white38,
          focusColor: null,
          labelText: title,
          labelStyle: TextStyle(
            color: AllColors.INPUT_WHITE,
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class ITextField extends StatelessWidget {
  ITextField(
      {Key key,
      this.name,
      this.hint,
      this.type,
      InputDecoration decoration,
      Color cursorColor})
      : super(key: key);

  final String name;
  final String hint;
  final String type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: IColors.dark_purple,
      decoration: InputDecoration(
          labelText: name,
          hintText: hint,
          hintStyle: TextStyle(color: IColors.dark_purple, fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
              color: IColors.dark_purple, fontWeight: FontWeight.w400),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: IColors.dark_purple, width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: IColors.dark_purple, width: 3),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: IColors.dark_purple, width: 2),
          )),
    );
  }
}

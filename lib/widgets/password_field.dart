import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class IPasswordField extends StatefulWidget {
  const IPasswordField({
    this.name,
    this.hint,
    this.controller,
    this.showError,
    this.errorMessage,
  });

  final String name;
  final String hint;
  final bool showError;
  final String errorMessage;
  final TextEditingController controller;

  @override
  _IPasswordFieldState createState() => new _IPasswordFieldState();
}

class _IPasswordFieldState extends State<IPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      cursorColor: IColors.dark_purple,
      decoration: InputDecoration(
        labelText: widget.name,
        hintText: widget.hint,
        hintStyle: TextStyle(color: IColors.dark_purple, fontSize: 13),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle:
            TextStyle(color: IColors.dark_purple, fontWeight: FontWeight.w400),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: IColors.dark_purple, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: IColors.dark_purple, width: 3),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: IColors.dark_purple, width: 2),
        ),
        errorText: widget.showError ? widget.errorMessage : null,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: new Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: IColors.dark_purple,
          ),
        ),
      ),
    );
  }
}

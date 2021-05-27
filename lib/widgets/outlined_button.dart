import 'package:flutter/material.dart';

class IOutlinedButton extends StatelessWidget {
  IOutlinedButton({Key key, this.text, this.event}) : super(key: key);

  final String text;
  final Function event;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onSurface: Colors.grey,
        shadowColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        side: BorderSide(color: Colors.black45, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }
}

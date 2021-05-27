import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class IDarkButton extends StatelessWidget {
  IDarkButton({Key key, this.text, this.event}) : super(key: key);

  final String text;
  final Function event;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
          primary: IColors.dark_purple,
          shadowColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class ITextLink extends StatelessWidget {
  ITextLink({Key key, this.text, this.event}) : super(key: key);

  final String text;
  final Function event;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Text(
        text,
        style: TextStyle(
            color: IColors.dark_blue,
            fontWeight: FontWeight.w500,
            fontSize: 14.0),
      ),
    );
  }
}

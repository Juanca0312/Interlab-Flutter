import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class ITopBar extends StatelessWidget {
  ITopBar({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 600,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/brandLogo.png',
            width: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              text,
              style: TextStyle(
                  color: IColors.dark_blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }
}

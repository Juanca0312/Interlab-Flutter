import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class ITopBar extends StatelessWidget {
  ITopBar({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width * 1,
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
      ),
    );
  }
}

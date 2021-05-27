import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';

class IBanner extends StatelessWidget {
  IBanner({Key key, this.title, this.hint}) : super(key: key);

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 600,
      child: Stack(
        children: [
          Image.asset('assets/TitleBG.png',
              width: 420.0, height: 550.0, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25.0),
                ),
                Text(
                  'Interlab',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    hint,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

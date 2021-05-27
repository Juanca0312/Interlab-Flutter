import 'package:flutter/material.dart';

class IRegisterInfo extends StatelessWidget {
  IRegisterInfo({Key key, this.text, this.title}) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

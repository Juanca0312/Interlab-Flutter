import 'package:flutter/material.dart';

class IRegisterInfo extends StatelessWidget {
  IRegisterInfo({Key key, this.text, this.title}) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(title,
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
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

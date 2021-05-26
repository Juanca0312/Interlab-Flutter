import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Navigate {
  static void to(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

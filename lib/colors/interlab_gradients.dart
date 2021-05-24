import 'package:flutter/cupertino.dart';

import 'package:interlab/colors/interlab_colors.dart';

class IGradients{
  static const LinearGradient green_lightblue = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [IColors.green, IColors.lightblue]);
  static const LinearGradient yellow_orange = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [IColors.yellow, IColors.orange]);
  static const LinearGradient purple_pink = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [IColors.purple, IColors.pink]);
  static const LinearGradient lightblue_blue = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [IColors.lightblue, IColors.blue]);
  static const LinearGradient blue_lightblue = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [IColors.blue, IColors.lightblue]);
}
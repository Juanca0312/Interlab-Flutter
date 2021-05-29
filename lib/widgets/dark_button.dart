import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:progress_indicator_button/progress_button.dart';

class IDarkButton extends StatelessWidget {
  IDarkButton({Key key, this.text, this.event}) : super(key: key);

  final String text;
  final Function event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
      child: ProgressButton(
        borderRadius: BorderRadius.circular(50),
        onPressed: (AnimationController controller) async {
          controller.forward();
          await event();
          controller.reset();
        },
        color: IColors.dark_purple,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

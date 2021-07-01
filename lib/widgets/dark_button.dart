import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:progress_indicator_button/progress_button.dart';

class IDarkButton extends StatelessWidget {
  IDarkButton({Key key, this.text, this.event, this.checked=true}) : super(key: key);

  final String text;
  final Function event;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
      child: ProgressButton(
        borderRadius: BorderRadius.circular(50),
        onPressed: (AnimationController controller) async {
          if(checked){
            controller.forward();
            await event();
            controller.reset();
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Acepta nuestros términos y condiciones para registrarte")));
            controller.reset();
          }
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

import 'package:flutter/material.dart';

class TitleAndContentWithIcon extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color color;
  static const double horizontal_padding=20;
  static const double vertical_padding=25;
  const TitleAndContentWithIcon(this.title, this.content, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontal_padding, vertical: vertical_padding),
          child: Container(child: Icon(icon, size: 35, color: color,)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: 17
                ),
              ),
              SizedBox(height: 5,),
              Text(
                  content
              )
            ],
          ),
        ),
      ],
    );
  }
}

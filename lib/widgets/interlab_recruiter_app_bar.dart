import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterlabRecruiterAppBar extends StatefulWidget implements PreferredSizeWidget  {
  final int index;
  final double height;

  const InterlabRecruiterAppBar({this.index, this.height});

  @override
  _InterlabRecruiterAppBarState createState() => _InterlabRecruiterAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(height);
}

class _InterlabRecruiterAppBarState extends State<InterlabRecruiterAppBar> {
  List<String> titles = [
    'Home',
    'My Profile',
    'Offer History',
    'Create Offer'
  ];
  List<String> subtitles = [
    'Tus publicaciones activas.',
    'Personaliza como te ven los aplicantes.',
    'Visualiza tus publicaciones anteriores.',
    'Crea una oferta de pasantía.'
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //Color del appbar
      backgroundColor: Colors.white.withOpacity(0),
      //Quita el separador/sombra
      elevation: 0,
      //Altura del appbar
      toolbarHeight: MediaQuery.of(context).size.height * 0.15,
      //Contenido del appbar
      title: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${titles[widget.index]}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )
                ),
                Text(
                    '${subtitles[widget.index]}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                    ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                  'assets/InterlabIcon.png'
              ),
            )
          ],
        ),
      ),
    );
  }
}
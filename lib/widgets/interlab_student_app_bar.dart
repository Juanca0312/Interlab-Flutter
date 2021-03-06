import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InterlabStudentAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final int index;
  final double height;

  const InterlabStudentAppBar({this.index, this.height});

  @override
  _InterlabStudentAppBarState createState() => _InterlabStudentAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(height);
}

class _InterlabStudentAppBarState extends State<InterlabStudentAppBar> {
  List<String> titles = [
    'Home',
    'My Profile',
    'Internship History',
    'Search Results'
  ];
  List<String> subtitles = [
    'Tus aplicaciones recientes.',
    'Personaliza como te ven las empresas.',
    'Visualiza tus aplicaciones anteriores.',
    'Encuentra su pasantia deseada.'
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //Color del appbar
      backgroundColor: Colors.transparent,
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
                Text('${titles[widget.index]}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    )),
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
              child: Image.asset('assets/InterlabIcon.png'),
            )
          ],
        ),
      ),
    );
  }
}

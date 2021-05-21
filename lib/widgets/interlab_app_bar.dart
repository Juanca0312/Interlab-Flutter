import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterlabAppBar extends StatefulWidget implements PreferredSizeWidget  {
  final int index;
  final double height;

  const InterlabAppBar({this.index, this.height});



  @override
  _InterlabAppBarState createState() => _InterlabAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(height);


}

class _InterlabAppBarState extends State<InterlabAppBar> {

  List<String> subtitles = [
    'Tus aplicaciones recientes.',
    'Personaliza como te ven las empresas.',
    'Visualiza tus aplicaciones anteriores.',
    'Encuentra su pasantia deseada.'
  ];

  List<String> titles = [
    'Home',
    'My Profile',
    'Internship History',
    'Search Results'
  ];


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0),
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.15,
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
                    style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        )
                    )
                ),
                Text(
                    '${subtitles[widget.index]}',
                    style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          color: Colors.black87,
                        )
                    )
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
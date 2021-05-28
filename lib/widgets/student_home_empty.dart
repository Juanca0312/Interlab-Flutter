import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:ms_undraw/ms_undraw.dart';

class StudentHomeEmpty extends StatefulWidget {
  const StudentHomeEmpty() : super();

  @override
  _StudentHomeEmptyState createState() => _StudentHomeEmptyState();
}

class _StudentHomeEmptyState extends State<StudentHomeEmpty> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: UnDraw(illustration: UnDrawIllustration.adventure_map, color: IColors.lightblue),
                )
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'No hay aplicaciones\nrecientes!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                    ),
                  )
                )
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    'Parece que no tienes aplicaciones\na pasantías, encuentra tu pasantía\ndeseada ahora.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w300,
                      fontSize: 13
                    ),
                  )
                )
              ),
            ],
          )
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              spreadRadius: 3,
              blurRadius: 8,
              offset: Offset(5, 5),
            ),
          ]
        ),
      ),
    );
  }
}


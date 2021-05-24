import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:ms_undraw/ms_undraw.dart';

class StudentHistoryEmpty extends StatefulWidget {
  const StudentHistoryEmpty() : super();

  @override
  _StudentHistoryEmptyState createState() => _StudentHistoryEmptyState();
}

class _StudentHistoryEmptyState extends State<StudentHistoryEmpty> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(flex: 15, child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: UnDraw(illustration: UnDrawIllustration.fitting_piece, color: IColors.lightblue),
                  )),
                  Expanded(
                      flex: 4,
                      child: Center(
                          child: Text(
                            'No hay aplicaciones\nhistóricas!',
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
                            'Parece que no tienes aplicaciones\nen tu historial, empieza buscando\nuna pasantía a tu medida.',
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
              ),
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


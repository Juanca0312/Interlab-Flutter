import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/models/internship.dart';
import 'package:interlab/widgets/title_and_content_with_icon.dart';
import 'package:ms_undraw/ms_undraw.dart';

class InternshipDetails extends StatefulWidget {
  final Internship internship;

  const InternshipDetails(this.internship);

  @override
  _InternshipDetailsState createState() => _InternshipDetailsState();
}

class _InternshipDetailsState extends State<InternshipDetails> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.internship.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${widget.internship.company} - ${widget.internship.location}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                gradient: widget.internship.bgGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TitleAndContentWithIcon(
                    "Descripción",
                    widget.internship.description,
                    Icons.description,
                    IColors.blue),
                TitleAndContentWithIcon(
                    "Salario",
                    'S/ ${widget.internship.salary}',
                    Icons.payments,
                    IColors.pink),
                TitleAndContentWithIcon(
                    "Fecha de Contrato",
                    '${widget.internship.startingDate} - ${widget.internship.finishDate}',
                    Icons.payments,
                    IColors.orange),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: UnDraw(
                            illustration: UnDrawIllustration.feeling_proud,
                            color: IColors.lightblue))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:ms_undraw/ms_undraw.dart';

class SuccessfulCreateCompanyOffer extends StatelessWidget {
  final String title;

  const SuccessfulCreateCompanyOffer({this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: UnDraw(
                    illustration: UnDrawIllustration.order_confirmed,
                    color: IColors.lightblue),
              )),
          SizedBox(
            height: 30,
          ),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                'Oferta de trabajo creada',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ))),
          Expanded(
              flex: 4,
              child: Center(
                  child: Text(
                'Se registró en Interlab y es visible\npara todos los aplicantes!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ))),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

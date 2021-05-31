import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/widgets/student_history_empty.dart';
import 'package:ms_undraw/illustrations.g.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:interlab/models/offer_history.dart';

class History extends StatefulWidget {
  const History();

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<Offer> mockApplications=[
    new Offer('Junnior HUrtado', '20-01-2020'),
    new Offer('Jeremy Salazar', '20-01-2020'),
    new Offer('Alberto Humo', '20-01-2020'),
    new Offer('Alberto Hum', '20-01-2020'),
    new Offer('Jeremy Bazán', '20-01-2020'),
    new Offer('Jeremy Salazar', '20-01-2021'),
    new Offer('Jeremy Salazar', '20-01-2020')
  ];

  //bool loading=true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Container(
          child: ClipRRect(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                tableTitleWidget(),
                Expanded(
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: mockApplications.length+1,
                        itemBuilder: (BuildContext context, int i){
                          if (i==mockApplications.length){
                            return _buildIllustration();
                          }
                          return _buildRow(mockApplications[i], i);
                        }
                    ),
                  ),
                ),
              ],
            ),
            //To clip the border radius, since Container does not clip inside elements
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(5, 5),
              ),
            ],
            borderRadius: BorderRadius.all(
                Radius.circular(15)
            ),
          )
      ),
    );
  }
  Widget _buildRow(Offer offer, int i){
    return offerWidget(offer, i);
  }
  Widget _buildIllustration(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: UnDraw(illustration: UnDrawIllustration.back_home, color: IColors.lightblue, height: 100,),
    );
  }
  Widget offerWidget(Offer  offer, int i){
    return Container(
      color: Colors.grey[50+250*(i%2)],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              offer.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            Text(
              offer.date,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget tableTitleWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Estudiante',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            ),
            Text(
              'Contratación',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: IGradients.yellow_orange
      ),
    );
  }
}


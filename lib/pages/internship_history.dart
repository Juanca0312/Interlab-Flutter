import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<Internship> mockApplications=[
    new Internship('ACME', '20-01-2020'),
    new Internship('Google', '20-01-2020'),
    new Internship('Novatronic', '20-01-2020'),
    new Internship('Facebook', '20-01-2020'),
    new Internship('Amazon', '20-01-2020'),
    new Internship('Facebook', '20-01-2021'),
    new Internship('Amazon', '20-01-2020')
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: mockApplications.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: const EdgeInsets.only(bottom: 0),

            //TODO: CARD GENERAL
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset:
                    Offset(2.0, 4.0), // shadow direction: bottom right
                  )
                ],
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(0))),
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Container( //TODO: CardCuerpo
                  margin: EdgeInsets.all(0),
                  padding: const EdgeInsets.only(bottom: 0),

                  //color: Colors.purple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 0),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(
                          '${mockApplications[i].company}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 0),

                        alignment: Alignment.centerRight,
                        child: Text(
                            mockApplications[i].date
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}

class Internship {
  String company;
  String date;

  LinearGradient bgGradient;
  Internship(this.company, this.date){}
}

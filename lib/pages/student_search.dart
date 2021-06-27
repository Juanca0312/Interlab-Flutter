import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/services/internship_service.dart';
import 'package:interlab/models/internship.dart';
import 'package:interlab/widgets/internship_details.dart';
import 'package:interlab/widgets/loading.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  InternshipService internshipService = new InternshipService();
  List<Internship> internships = [];
  bool loading = true;

  void getData() async {
    await internshipService.getData();
    assignData();
  }

  void assignData() {
    loading = false;
    setState(() {
      internships = internshipService.internships;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: internships.length,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                //TODO: CARD GENERAL
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CardNav(
                      internships: internships,
                      i: i,
                      internshipService: internshipService,
                    ), //TODO: CardSuperior

                    Container(
                      //TODO: CardCuerpo
                      margin: EdgeInsets.all(10),
                      //color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              'Salario: S/. ${internships[i].salary}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return InternshipDetails(internships[i]);
                                    },
                                    animationType:
                                        DialogTransitionType.slideFromBottom,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(milliseconds: 500));
                              },
                              child: Center(
                                child: Text(
                                  '+ ver más detalles',
                                  style: TextStyle(
                                      color: IColors.blue,
                                      fontWeight: FontWeight.w600),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}

class CardNav extends StatefulWidget {
  final i;

  const CardNav(
      {Key key, @required this.internships, this.i, this.internshipService})
      : super(key: key);

  final List<Internship> internships;
  final InternshipService internshipService;

  @override
  _CardNavState createState() => _CardNavState();
}

class _CardNavState extends State<CardNav> {



  @override
  Widget build(BuildContext context) {

    void postRequest()async{
      bool response = await widget.internshipService.postRequest(widget.internships[widget.i].id);
      Navigator.of(context).pop();
      if(!response){
        Timer timer = Timer(Duration(milliseconds: 3000), (){
          Navigator.of(context, rootNavigator: true).pop();
        });
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('Ya aplicaste a esta Pasantía', textAlign: TextAlign.center,)),
            );
          },
        ).then((value){
          // dispose the timer in case something else has triggered the dismiss.
          timer?.cancel();
          timer = null;
        });

      }
    }

    return Container(
      ///TODO: CARD Inicio
      decoration: BoxDecoration(
          gradient: widget.internships[widget.i].bgGradient,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    //color: Colors.lightGreenAccent,
                    child: Text(
                      widget.internships[widget.i].title,
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    //color: Colors.pink,
                    child: Text(
                      widget.internships[widget.i].company,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ))
              ],
            ),
            FlatButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Postular?'),
                      content: Text('Estas a punto de postular a una pasantía'),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: IColors.blue_accent),
                            ),
                            height: 30,
                            width: 80,
                            child: Center(
                                child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: postRequest,
                          child: Container(
                            decoration: BoxDecoration(
                                color: IColors.blue_accent,
                                borderRadius: BorderRadius.circular(10)),
                            height: 30,
                            width: 80,
                            child: Center(
                                child: Text(
                              'Postular',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              child: Text('Postular',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.black, width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
            )
          ],
        ),
      ),
    );
  }
}

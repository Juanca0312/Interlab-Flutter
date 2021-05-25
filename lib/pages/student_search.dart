import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/services/internship_service.dart';
import 'package:interlab/models/internship.dart';
import 'package:interlab/widgets/loading.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  InternshipService internshipService = new InternshipService();
  List<Internship> internships=[];
  bool loading = true;


  void getData() async {
    await internshipService.getData();
    assignData();
  }

  void assignData(){
    loading=false;
    setState(() {
      internships=internshipService.internships;
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
    return loading? Loading() : ListView.builder(
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
                CardNav(internships: internships, i: i,), //TODO: CardSuperior

                Container( //TODO: CardCuerpo
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
                            fontWeight: FontWeight.w500,
                          ),
                            ),
                      ),
                      Container(
                        child: Text(
                            internships[i].description
                        ),
                      ),
                      Container(
                        child: Text(
                            'Lugar: ${internships[i].location}'
                        ),
                      )
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

class CardNav extends StatelessWidget {
  final i;
  const CardNav({
    Key key,
    @required this.internships, this.i
  }) : super(key: key);

  final List<Internship> internships;

  @override
  Widget build(BuildContext context) {
    return Container(
      ///TODO: CARD Inicio
      decoration: BoxDecoration(
          gradient: internships[i].bgGradient,
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
                    margin: EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10),
                    //color: Colors.lightGreenAccent,
                    child: Text(
                      internships[i].title,
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10),
                    //color: Colors.pink,
                    child: Text(
                      internships[i].company,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ))
              ],
            ),
            FlatButton(
              onPressed: (){},
              child: Text('Postular', style: TextStyle(
                  color: Colors.black,
                decoration: TextDecoration.underline
              )
              ),
              textColor: Colors.white,

              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid
              ), borderRadius: BorderRadius.circular(50)),
            )

          ],
        ),
      ),
    );
  }
}

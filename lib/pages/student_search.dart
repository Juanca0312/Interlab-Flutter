import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/services/internship.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<Internship> mockApplications=[
    new Internship(title: 'Summer Internship 2021', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'Diseñador Web', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'Diseñador Mobil', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'Arquitecto de Software', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'Backend Developer', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'Angular Developer', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
    new Internship(title: 'C++ Junior programmer', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' ),
  ];

  Internship pruebita = Internship(title: 'Summer Internship 2021', company: 'Empresa ACME', location:'Palo Alto, CA', salary: ' S/ 5,000 a S/ 6,000 al mes', description: 'Trabajo para empresa ACME, se busca diseñador web' );

  void getData() async {
    await pruebita.getData();
    //print(pruebita)
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mockApplications.length,
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
                CardNav(mockApplications: mockApplications, i: i,), //TODO: CardSuperior

                Container( //TODO: CardCuerpo
                  margin: EdgeInsets.all(10),
                  //color: Colors.purple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                            'Salario: ${mockApplications[i].salary}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                            ),
                      ),
                      Container(
                        child: Text(
                          mockApplications[i].description
                        ),
                      ),
                      Container(
                        child: Text(
                            'Lugar: ${mockApplications[i].location}'
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
    @required this.mockApplications, this.i
  }) : super(key: key);

  final List<Internship> mockApplications;

  @override
  Widget build(BuildContext context) {
    return Container(
      ///TODO: CARD Inicio
      decoration: BoxDecoration(
          gradient: mockApplications[i].bgGradient,
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
                      mockApplications[i].title,
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 0, horizontal: 10),
                    //color: Colors.pink,
                    child: Text(
                      mockApplications[i].company,
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

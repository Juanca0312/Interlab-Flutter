
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

import 'package:interlab/widgets/app_bar_sup.dart';



class CHome extends StatefulWidget {



  @override
  _CHomeState  createState() => _CHomeState();
}

class _CHomeState extends State<CHome> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Container(
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
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
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient: IGradients.lightblue_blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Diseñador Web:'),
                              Text('Mas Info'),


                            ],
                          ),


                        ),

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('Salario de 5000 a 6000 dolares / mes.'),
                          Text(
                              'Descripcion: Lore Ipsum is a simply dummy text of the printing and typesetting industry.'
                                  ' Lorem Ipsum has been the industry'),
                          Text('Empresa : Diseño Web (1 año'),
                          Text('Educacion: 4to año de universidad')
                        ],
                      )


                    ]

                ),
              )
            ],


          ),


        ),




      ),


    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: Container(
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
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
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient: IGradients.lightblue_blue,
                          borderRadius: BorderRadius.all(Radius.circular(15)),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Diseñador Web:'),
                              Text('Mas Info'),


                            ],
                          ),


                        ),

                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('Salario de 5000 a 6000 dolares / mes.'),
                          Text(
                              'Descripcion: Lore Ipsum is a simply dummy text of the printing and typesetting industry.'
                                  ' Lorem Ipsum has been the industry'),
                          Text('Empresa : Diseño Web (1 año'),
                          Text('Educacion: 4to año de universidad')
                        ],
                      )


                    ]

                ),
              )
            ],


          ),


        ),




      ),


    );

    Widget Lista2() {
      return Row(
        children: <Widget>[
          Text('Diseñador Web'),
          Text('Mas info'),

        ],
      );
    }


    Widget Lista3() {
      return Row(
        children: <Widget>[
          Text('Diseñador Web'),
          Text('Mas info'),

        ],
      );
    }
    Widget Descripcion() {
      return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Salario: 5000 dolares a 6000 dolares /mes ', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),),
          Text(
            'Lore Ipsum is a simply dummy text of the printing and typesetting industry.'
                ' Lorem Ipsum has been the industry', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),),
          Text('Empresa: Interlab', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),),
          Text('Educacion: UPC', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),)
        ],
      );
    }
    Widget Descripcion2() {
      return Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Salario: 5000 dolares a 6000 dolares /mes ', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black38,
          ),),
          Text('Detalle de trabajador ', style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.lightBlueAccent,
          ),)
        ],
      );
    }
  }
}

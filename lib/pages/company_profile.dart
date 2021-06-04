import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:interlab/colors/interlab_gradients.dart';



class CProfile extends StatefulWidget {



  @override
  _CProfile  createState() => _CProfile();
}

class _CProfile extends State<CProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                margin: EdgeInsets.fromLTRB(30, 10,  30, 10),
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
                            children: [
                              Image.asset('assets/user.png'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    child: Text('Juan Leyva'),
                                  ),

                                ],)
                            ],
                          ),

                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text('Soy recruiter de la empresa:'),
                          Text('NOVATRONIC'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                    offset:
                                    Offset(2.0, 2.0), // shadow direction: bottom right
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            margin: EdgeInsets.fromLTRB(40, 20,  40, 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>
                                [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 50),
                                    child: Text('Sobre la Empresa:'),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text('Las mejores empresas, sin importar la cantidad de empleados que tengan o en qué sector se encuentren,'
                                          ' se esfuerzan mucho por combinar elementos físicos, emocionales y lógicos en una experiencia excepcional tanto para los clientes como para los empleados. Sin embargo, lograr la fidelidad no es fácil. '
                                          'Es necesario crear una empresa que despierte el orgullo tanto en colaboradores como en compradores. '
                                          'Por eso, hoy compartimos contigo algunos ejemplos inspiradores de misión, visión y valores empresariales.')
                                    ],
                                  )

                                ]

                            ),
                          )
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
  }
  Widget DetalleEmpresa()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Soy recruiter de la empresa:'),
        Text('Novatronic')
      ],
    );

  }
  Widget DetalleRecruiter()
  {
    return  Scaffold(
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
                        color: Colors.white,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                        Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                margin: EdgeInsets.fromLTRB(30, 10,  30, 10),
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(15)),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20.0),
                          child: Row(

                            children: [
                              Text('Sobre la empresa:', style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black38,
                              ),),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    child: Text('Novatronic es una empresa dedicada al reclutamiento de personas...')
                                    ,
                                  ),

                                ],)
                            ],
                          ),

                        ),
                      )

                    ]

                ),
              )
            ],


          ),

        ),
      ),

    );
  }

}


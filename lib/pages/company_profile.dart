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
               Text('My Profile', style: TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.w400,
             color: Colors.black38,
           ),),
               Text('Personaliza como te ven los estudiantes', style: TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w400,
                 color: Colors.black38,
               ),),
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

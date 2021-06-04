
import 'package:flutter/material.dart';

import 'package:interlab/widgets/app_bar_sup.dart';



class CHome extends StatefulWidget {



  @override
  _CHomeState  createState() => _CHomeState();
}

class _CHomeState extends State<CHome> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NavBarSuperior(),
          Image.asset('assets/'
              'InterlabIcon.png'
            ,width: 30.0,)
          ,
          this.Lista1(),
          this.Descripcion(),
          this.Lista1(),
          this.Descripcion2(),
          this.Lista1(),
          this.Descripcion2(),

          ]

      ),


    );
}
Widget Lista1(){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        Text('Diseñador web',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        ),Text('Mas Info',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ) ,




      ],
    ),





  );

}
  Widget Lista2(){
    return Row(
      children: <Widget>[
        Text('Diseñador Web'),
        Text('Mas info'),

      ],
    );
  }


  Widget Lista3(){
    return Row(
      children: <Widget>[
        Text('Diseñador Web'),
        Text('Mas info'),

      ],
    );
  }
  Widget Descripcion()
  {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Salario: 5000 dolares a 6000 dolares /mes ', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black38,
        ),),
      Text('Lore Ipsum is a simply dummy text of the printing and typesetting industry.'
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
      ),)],
    );
  }
  Widget Descripcion2()
  {
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
    ),)],
    );
  }
}

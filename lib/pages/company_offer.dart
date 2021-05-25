import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Offter extends StatefulWidget {

  const Offter();

  @override
  _OffterState createState() => _OffterState();
}

class _OffterState extends State<Offter> {
  TextEditingController title = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  Widget buildTitle() {
    return TextFormField(
      controller: title,
      decoration: InputDecoration(labelText: 'Título de la oferta'),
      validator: (value) {
        if (value == null) {
          return 'Se requiere Titulo';
        }
        return null;
      },
      onChanged: (item){
        setState(() {

        });
      },
    );
  }
  Widget builName() {
    return TextFormField(
      controller: name,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Nombre de la empresa:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nombre es requerido';
        }
        return null;
      },
      onChanged: (item){
        setState(() {

        });
      },
    );
  }
  Widget buildSalary() {
    return TextFormField(
      controller: salary,
      maxLines: 2,
      decoration: InputDecoration(labelText: 'Salario '),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Agrege Salario';
        }
        return null;
      },
      onChanged: (item){
        setState(() {

        });
      },
    );
  }
  Widget buildDetail( ) {
    return TextFormField(
      controller: bio,
      maxLines: 3,
      decoration: InputDecoration(labelText: 'Detalles de la oferta:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Se requiere Detalles ';
        }
        return null;
      },
      onChanged: (item){
        setState(() {

        });
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox.expand(
          child: Container(
            //height:  MediaQuery.of(context).size.height * 0.85,
            //margin: EdgeInsets.fromLTRB(0,0, 0, 10),
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
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
                    margin: EdgeInsets.fromLTRB(30, 10,  30, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Form(
                          //Form de Estudiante
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20.0),
                            child: Column(
                              children: [
                                buildTitle(),
                                builName(),
                                buildSalary(),
                                buildDetail(),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ButtonStyle(),
                                  child: Text('Siguiente'),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
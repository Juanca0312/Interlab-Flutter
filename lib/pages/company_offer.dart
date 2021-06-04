import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/widgets/textBox.dart';



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


  Widget Arrow() {
    return DropdownButtonFormField<String>(

      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      decoration: InputDecoration(
        filled: true,
        fillColor:  Colors.white,
        labelText: 'Titulo de la oferta',
        //border: new CustomBorderTextFieldSkin().getSkin(),
      ),
    //... underline: Container(
    //...   height: 2,
    //...   color: Colors.deepPurpleAccent,
    //... ),
      //onChanged: (String? newValue) {
      //  setState(() {
      //    dropdownValue = newValue!;
      //  });
      //},
      items: <String>['UX Designer Intern', 'Web']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }





  Widget buildTitle() {
    return TextFormField(
      controller: name,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Titulo de la oferta:'),
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
    );;

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
     return TextBox(
       placeHolder: 'Detalles de la oferta:',
       keyboardType: TextInputType.multiline,

     );
   }
  String dropdownValue = 'UX Designer Intern';
  @override



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
                                SizedBox(height: 10,),
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
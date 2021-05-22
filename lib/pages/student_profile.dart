import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/services/profile_student.dart';


class Profile extends StatefulWidget {
  final int subtitle;

  const Profile({this.subtitle});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String _carrera = 'Ingenieria de Software';
  String _ciclo = '9';
  String _university = 'Universidad Peruana de Ciencias Aplicadas';
  String _bio =
      'Estudiante de 9no ciclo de la carrera de Ingeniería de Software. Especializado en tecnologías. Front End y Mobile, con conocimento en: HTML, CSS, JavaScript,  React y Vue. 1 año de experiencia';
  String _phone = '999124365';
  String _email = 'email@email.com';

  String _name = 'Cargando...';
  ProfileS profile = ProfileS();

  final _formKey = GlobalKey<FormState>();

  void getData() async {
    await profile.getData();
    setState(() {
      _name = profile.firstName;
    });
  }

  Widget _buildCarrera() {
    return TextFormField(
      initialValue: _carrera,
      decoration: InputDecoration(labelText: 'Soy estudiante de:'),
      validator: (value) {
        if (value == null) {
          return 'Carrera es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _carrera = value;
        });
      },
    );
  }
  Widget _buildCiclo() {
    return TextFormField(
      initialValue: _ciclo,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'En el ciclo:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Carrera es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _ciclo = value;
        });
      },
    );
  }
  Widget _buildUniversity() {
    return TextFormField(
      initialValue: _university,
      maxLines: 2,
      decoration: InputDecoration(labelText: 'En la universidad: '),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Universidad es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _university = value;
        });
      },
    );
  }
  Widget _buildBio( ) {
    return TextFormField(
      initialValue: _bio,
      maxLines: 5,
      decoration: InputDecoration(labelText: 'Bio'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Bio es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _bio = value;
        });
      },
    );
  }
  Widget _buildPhone( ) {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: _phone,
      decoration: InputDecoration(labelText: 'Numero de Telefono'),
      validator: (String value) {
        if (value.isEmpty && value.length < 8) {
          return 'Telefono invalido';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _phone = value;
        });
      },
    );
  }
  Widget _buildEmail() {
    return TextFormField(
      initialValue: _email,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email es requerido';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getData();
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
                        Container(
                          ///TODO: CARD Inicio
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.cyanAccent[200],
                                Colors.blueAccent
                              ]),
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20.0),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/user.png'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        //color: Colors.lightGreenAccent,
                                        child: Text(
                                          _name,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                        //color: Colors.pink,
                                        child: Text(
                                          'Estudiante',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Form(
                          //Form de Estudiante
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20.0),
                            child: Column(
                              children: [
                                _buildCarrera(),
                                _buildCiclo(),
                                _buildUniversity(),
                                _buildBio(),
                                _buildPhone(),
                                _buildEmail(),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  style: ButtonStyle(

                                  ),
                                  onPressed: _ciclo == '' || _carrera == ''
                                      || _university == '' || _bio == ''
                                      || _phone == '' || _email == ''? null : (){
                                    //funcion guardar en http
                                  }, child: _ciclo == '' || _carrera == ''
                                    || _university == '' || _bio == ''
                                    || _phone == '' || _email == ''? Text('Llenar datos') : Text('Guardar'),)
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




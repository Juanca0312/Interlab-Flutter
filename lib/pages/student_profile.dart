import 'package:flutter/material.dart';

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCarrera() {
    return TextFormField(
      initialValue: _carrera,
      decoration: InputDecoration(labelText: 'Soy estudiante de:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Carrera es requerida';
        }
      },
      onSaved: (String value) {
        _carrera = value;
      },
    );
  }

  Widget _buildCiclo() {
    return TextFormField(
      initialValue: '${_ciclo}° ciclo',
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'En el ciclo:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Carrera es requerida';
        }
      },
      onSaved: (String value) {
        _ciclo = '${value}° ciclo';
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
          return 'Carrera es requerida';
        }
      },
      onSaved: (String value) {
        _university = value;
      },
    );
  }

  Widget _buildBio() {
    return TextFormField(
      initialValue: _bio,
      maxLines: 5,
      decoration: InputDecoration(labelText: 'Bio'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Carrera es requerida';
        }
      },
      onSaved: (String value) {
        _bio = value;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Container(
            //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            //color: Colors.amberAccent,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover,
                )
            ),
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
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                                          'Marcelo Martinez',
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
                                _buildUniversity(),
                                _buildBio(),
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

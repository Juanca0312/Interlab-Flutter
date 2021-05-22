import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interlab/services/profile_student.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/widgets/loading.dart';


class Profile extends StatefulWidget {

  const Profile();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController degree = TextEditingController();
  TextEditingController semester = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String _name = 'Cargando...';
  bool loading = true;

  ProfileS profile = ProfileS();

  final _formKey = GlobalKey<FormState>();

  void asignData () {
    setState(() {
      loading = false;
      _name = '${profile.firstName} ${profile.lastName}';
      degree.text = profile.degree;
      semester.text = profile.semester;
      university.text = profile.university;
      bio.text = profile.description;
      phone.text = profile.phone;
      email.text = profile.email;
      print(profile.degree);
    });
  }

  void getData() async {
    await profile.getData();
    //print('hola1');
    asignData();
  }

  Widget _buildCarrera() {
    return TextFormField(
      controller: degree,
      decoration: InputDecoration(labelText: 'Soy estudiante de:'),
      validator: (value) {
        if (value == null) {
          return 'Carrera es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          degree.text = value;
        });
      },
    );
  }
  Widget _buildCiclo() {
    return TextFormField(
      controller: semester,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'En el ciclo:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Ciclo es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          semester.text = value;
        });
      },
    );
  }
  Widget _buildUniversity() {
    return TextFormField(
      controller: university,
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
          university.text = value;
        });
      },
    );
  }
  Widget _buildBio( ) {
    return TextFormField(
      controller: bio,
      maxLines: 3,
      decoration: InputDecoration(labelText: 'Bio'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Bio es requerida';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          bio.text = value;
        });
      },
    );
  }
  Widget _buildPhone( ) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: phone,
      decoration: InputDecoration(labelText: 'Numero de Telefono'),
      validator: (String value) {
        if (value.isEmpty && value.length < 8) {
          return 'Telefono invalido';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          phone.text = value;
        });
      },
    );
  }
  Widget _buildEmail() {
    return TextFormField(
      controller: email,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email es requerido';
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          email.text = value;
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
    return loading ? Loading() : Scaffold(
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
                              gradient: IGradients.blue_lightblue ,
                              borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20.0),
                            child: Row(
                              //mainAxisAlignment: MainA xisAlignment.spaceBetween,
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
                                  onPressed: semester.text == '' || degree.text == ''
                                      || university.text == '' || bio.text == ''
                                      || phone.text == '' || email.text == ''? null : (){
                                    //endpoint put
                                  }, child: semester.text == '' || degree.text == ''
                                    || university.text == '' || bio.text == ''
                                    || phone.text == '' || email.text == '' ? Text('Llenar datos') : Text('Guardar'),)
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






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:interlab/services/profile_student.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/colors/interlab_colors.dart';


class Profile extends StatefulWidget {

  const Profile();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  ProfileS profile = ProfileS();
  //variables
  String firstName ="";
  String role = "";
  String lastName = "";
  String description = "";
  String email = "";
  String university ="";
  String phone = "";
  String semester = "";
  String degree = "";
  //controllers
  final TextEditingController _firstNameC = TextEditingController();
  final TextEditingController _lastNameC = TextEditingController();
  final TextEditingController _descriptionC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _universityC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _semesterC = TextEditingController();
  final TextEditingController _degreeC = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  bool loading = true;

  void assignData () {
    loading = false;
    firstName = profile.firstName;
    role = profile.role;
    lastName = profile.lastName;
    description = profile.description;
    email = profile.email;
    university = profile.university;
    phone = profile.phone;
    semester = profile.semester;
    degree = profile.degree;

    //controller
    _firstNameC.text = firstName;
    _lastNameC.text = lastName;
    _descriptionC.text = description;
    _emailC.text = email;
    _universityC.text = university;
    _phoneC.text = phone;
    _semesterC.text = semester;
    _degreeC.text = degree;
    setState(() {

    });
  }

  void editData(){
    print(_firstNameC.text);
    profile.firstName=_firstNameC.text;
    profile.role=_lastNameC.text;
    profile.lastName=_lastNameC.text;
    profile.description= _descriptionC.text;
    profile.email=_emailC.text;
    profile.university=_universityC.text;
    profile.phone=_phoneC.text;
    profile.semester=_semesterC.text;
    profile.degree=_degreeC.text;
    setState(() {

    });
  }

  void getData() async {
    await profile.getData();
    assignData();
  }

  void updateData() async {
    editData();
    await profile.updateData();
    assignData();
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
                          ///TODO: CARD TITLE
                          decoration: BoxDecoration(
                              gradient: IGradients.lightblue_blue,
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
                                          '$firstName $lastName',
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
                                ),
                                IconButton(icon: Icon(Icons.edit, color: Colors.grey[800],), onPressed: (){ //TODO: Edit Profile
                                  return showAnimatedDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                          insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),

                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: ListView(
                                              children: [Column(
                                                children: <Widget>[
                                                  Text('Edit Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                                  Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          controller: _firstNameC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                            labelText: 'Nombre'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          controller: _lastNameC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Apellidos'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          controller: _degreeC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Carrera'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          controller: _semesterC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Ciclo'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          controller: _universityC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Universidad'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          controller: _emailC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Email'
                                                          ),
                                                        ),
                                                        TextFormField(
                                                          keyboardType: TextInputType.phone,
                                                          controller: _phoneC,
                                                          validator: (value){
                                                            return value.isNotEmpty ? null : 'Campos Inválidos';
                                                          },
                                                          decoration: InputDecoration(
                                                              labelText: 'Celular'
                                                          ),
                                                        ),
                                                        SizedBox(height: 15,),
                                                        InkWell(
                                                          onTap: (){
                                                            if(_formKey.currentState.validate()){
                                                              loading = true;
                                                              setState(() {

                                                              });
                                                              updateData();
                                                              Navigator.of(context).pop();
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 35,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                              color: IColors.blue
                                                            ),
                                                            child: Center(child: Text('Guardar', style: TextStyle(color: Colors.white),)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),]
                                            ),
                                          ),
                                        );
                                      },
                                      animationType: DialogTransitionType.slideFromBottom,
                                      curve: Curves.fastOutSlowIn,
                                      duration: Duration(milliseconds: 500)
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _label(' Soy estudiante de: ',degree),
                              SizedBox(height: 10,),
                              _label(' En el ciclo: ','$semester° ciclo'),
                              SizedBox(height: 10,),
                              _label(' En la universidad: ',university),
                              SizedBox(height: 10,),
                              _label(' Con email: ', email),
                              SizedBox(height: 10,),
                              _label(' Con teléfono: ', phone),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5, left: 5),
                                child: Text('Bio', style: TextStyle(fontWeight: FontWeight.w300),),
                              ),
                              Container(
                                height: 90,
                                decoration: BoxDecoration(
                                  border: Border.all(color: IColors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(description),
                                ),
                              )
                            ],
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

Widget _label (String title, String data){
  return Container(
    height: data.length > 25 ? 80 : 60,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2, color: IColors.blue),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontWeight: FontWeight.w300),),
        SizedBox(height: 3,),
        Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_down_rounded),
            SizedBox(width: 10,),
            Container(
              height: data.length > 25 ? 50 : 30,
                width: 250,
                child: Text(data, style: TextStyle(fontSize: 16),))
          ],
        ),
      ],
    ),
  );
}






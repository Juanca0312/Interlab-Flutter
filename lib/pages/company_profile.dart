import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interlab/services/profile_company.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interlab/services/auth_service.dart';

class CProfile extends StatefulWidget {
  @override
  _CProfile createState() => _CProfile();
}

class _CProfile extends State<CProfile> {
  ProfileC profile = ProfileC();

  File profilePhoto;
  //variables
  String displayName = "";
  String nameC = "";
  String role = "";
  String sector = "";
  String description = "";
  String email = "";
  String phone = "";
  String address = "";
  String country = "";
  String city = "";

//controllers
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _roleC = TextEditingController();
  final TextEditingController _sectorC = TextEditingController();
  final TextEditingController _descriptionC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _addressC = TextEditingController();
  final TextEditingController _cityC = TextEditingController();
  final TextEditingController _countryC = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = true;

  Future<void> setImageFileSharedPreferences(File image) async {
    final prefs = await SharedPreferences.getInstance();
    String path = image.path;
    await prefs.setString('user_photo', path);
  }

  Future<String> _getImageFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_photo');
  }

  Future<void> _startup() async {
    final image = await _getImageFromSharedPref();
    if (image != null) {
      setState(() {
        profilePhoto = File(image);
      });
    }
  }

  void assignData() {
    loading = false;
    nameC = profile.nameC;
    displayName = StringUtils.truncate(profile.nameC, 10);
    role = 'Recruiter';
    sector = profile.sector;
    description = profile.description == null ? '' : profile.description;
    email = profile.email = profile.email;
    phone = profile.phone = profile.phone;
    address = profile.address = profile.address;
    city = profile.city = profile.city;
    country = profile.country = profile.country;

    //controller
    _nameC.text = nameC;
    _roleC.text = role;
    _sectorC.text = sector;
    _descriptionC.text = description;
    _emailC.text = email;
    _phoneC.text = phone;
    _addressC.text = address;
    _cityC.text = city;
    _countryC.text = country;

    setState(() {});
    if (email == '' || email == null) {
      _dialogEditProfile();
    }
  }

  void editData() {
    profile.nameC = _nameC.text;
    profile.sector = _roleC.text;
    profile.description = _descriptionC.text;
    profile.email = _emailC.text;
    profile.phone = _phoneC.text;
    profile.address = _addressC.text;
    profile.city = _cityC.text;
    profile.country = _countryC.text;

    setState(() {});
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

  void onPressLogout() async {
    AuthService authService = new AuthService();
    authService.logout();
    Navigate.removeUntil(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _startup();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              ///TODO: CARD TITLE
                              decoration: BoxDecoration(
                                  gradient: IGradients.lightblue_blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        profilePhoto == null
                                            ? CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/user_default.jpg'),
                                                radius: 25,
                                              )
                                            : CircleAvatar(
                                                backgroundImage:
                                                    FileImage(profilePhoto),
                                                radius: 25,
                                              ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                                //color: Colors.lightGreenAccent,
                                                child: Text(
                                                  '${StringUtils.truncate(nameC, 10)}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 10),
                                                //color: Colors.pink,
                                                child: Text(
                                                  'Reclutador',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.grey[800],
                                            ),
                                            onPressed: () {
                                              return _dialogEditProfile();
                                            }),
                                        IconButton(
                                            icon: Icon(
                                              Icons.logout,
                                              color: Colors.grey[800],
                                            ),
                                            onPressed: () {
                                              return onPressLogout();
                                            }),
                                      ],
                                    ),
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
                                  _label(' Soy recruiter de la empresa: ',
                                      '$nameC'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _label('Description: ', '$description'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _label(' Del rubro: ', '$sector'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _label(' Email: ', '$email'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _label(' Numero: ', '$phone'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _label(' Address: ', '$address'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  _labelCC(' En:', '$city', '$country'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 5),
                                    child: Text(
                                      'Bio',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Container(
                                    height: 90,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: IColors.blue, width: 2),
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

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setImageFileSharedPreferences(image);

    setState(() {
      profilePhoto = image;
    });
  }

  Future<Widget> _dialogEditProfile() {
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
              child: ListView(children: [
                Column(
                  children: <Widget>[
                    Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    profilePhoto == null
                        ? CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/user_default.jpg'),
                            radius: 35,
                            child: IconButton(
                              onPressed: () {
                                _imgFromGallery();
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.black,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(profilePhoto),
                            radius: 35,
                            child: IconButton(
                              onPressed: () {
                                _imgFromGallery();
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.black,
                            ),
                          ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(labelText: 'Empresa'),
                          ),
                          TextFormField(
                            controller: _descriptionC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration:
                                InputDecoration(labelText: 'Description'),
                          ),
                          TextFormField(
                            controller: _sectorC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(
                                labelText: 'Sector de la Empresa: '),
                          ),
                          TextFormField(
                            controller: _emailC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(labelText: 'Email: '),
                          ),
                          TextFormField(
                            controller: _phoneC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(labelText: 'Número: '),
                          ),
                          TextFormField(
                            controller: _addressC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(
                                labelText: 'Dirección de la Empresa: '),
                          ),
                          TextFormField(
                            controller: _cityC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(labelText: 'Ciudad: '),
                          ),
                          TextFormField(
                            controller: _countryC,
                            validator: (value) {
                              return value.isNotEmpty
                                  ? null
                                  : 'Campos Inválidos';
                            },
                            decoration: InputDecoration(labelText: 'Pais: '),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                loading = true;
                                setState(() {});
                                updateData();
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: IColors.blue),
                              child: Center(
                                  child: Text(
                                'Guardar',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
          );
        },
        animationType: DialogTransitionType.slideFromBottom,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500));
  }
}

Widget _label(String title, String data) {
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
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_down_rounded),
            SizedBox(
              width: 10,
            ),
            Container(
                height: data.length > 25 ? 50 : 30,
                width: 250,
                child: Text(
                  data,
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ],
    ),
  );
}

Widget _labelCC(String title, String city, String country) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2, color: IColors.blue),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_down_rounded),
            SizedBox(
              width: 10,
            ),
            Container(
                height: 30,
                width: 250,
                child: Text(
                  '$city, $country',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ],
    ),
  );
}

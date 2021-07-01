import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';
import 'package:interlab/pages/company_dashboard.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/services/auth_service.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
import 'package:interlab/widgets/password_field.dart';
import 'package:interlab/widgets/register_info.dart';
import 'package:interlab/widgets/terms_and_conditions_dialog.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:interlab/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:progress_indicator_button/button_stagger_animation.dart';
import 'package:progress_indicator_button/progress_button.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class RegisterCompany extends StatefulWidget {
  const RegisterCompany({Key key}) : super(key: key);

  @override
  _RegisterCompanyState createState() => _RegisterCompanyState();
}

class _RegisterCompanyState extends State<RegisterCompany> {
  AuthService authService = new AuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  bool showError = false;
  String errorMessage = 'Nombre de usuario o contraseña incorrectos';
  bool checked = false;


  void _register() async {
    if (passwordController.text == retypePasswordController.text) {
      Response response = await authService.registerCompany(
          usernameController.text,
          passwordController.text,
          nameController.text);
      if (response.statusCode == 200) {
        Navigate.replace(context, CompanyDashboard());
      } else {
        setShowError(true);
      }
    } else {
      setShowError(true);
      setErrorMessage('Las contraseñas no coinciden');
    }
  }

  void setShowError(bool value) {
    setState(() {
      showError = value;
    });
  }

  void setErrorMessage(String value) {
    setState(() {
      errorMessage = value;
    });
  }

  void _onChangePassword() {
    showError = false;
  }

  @override
  void initState() {
    super.initState();
    retypePasswordController = TextEditingController();
    passwordController.addListener(_onChangePassword);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                ITopBar(text: 'Empresa'),
                IBanner(
                    title: 'Regístrate en',
                    hint: 'Ingresa tus datos para continuar')
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .55,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          controller: usernameController,
                          name: 'Nombre de usuario',
                          hint: 'company@gmail.com',
                          showError: false)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          controller: nameController,
                          name: 'Nombres y Apellidos',
                          hint: 'Ángel Velásquez',
                          showError: false)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: IPasswordField(
                        controller: passwordController,
                        name: 'Contraseña',
                        hint: '••••••••••••••',
                        showError: showError,
                        errorMessage: errorMessage,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: IPasswordField(
                        controller: retypePasswordController,
                        name: 'Confirme su contraseña',
                        hint: '••••••••••••••',
                        showError: showError,
                        errorMessage: errorMessage,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ITextLink(
                          text: 'Eres Estudiante?',
                          event: () => Navigate.to(context, RegisterStudent())),
                      ITextLink(
                          text: 'Ya tienes cuenta?',
                          event: () => Navigate.to(context, Login())),
                    ],
                  ),

                  Row( children: <Widget>[
                    Checkbox(value: checked, onChanged: (v){
                      setState(() {
                        checked = v;
                      });
                    }),
                    Text("I Agree to  the "),
                    InkWell(
                      child: Text(
                        "Terms of services and Politics ",
                        style:TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),

                      ),
                      onTap: (){
                        showDialog(context: context,
                            barrierDismissible: false,
                            builder:(context) {

                                return TermsAndConditionsDialog();
                            }
                        );}

                      

                        ),




                  ],
                  ),

                  IDarkButton(
                    checked: checked,
                    text: 'REGISTRARSE',
                    event: _register,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IRegisterInfo(
                      title: 'Registrándose como Empresa:',
                      text:
                          'Te permitirá publicar ofertas de pasantías, acceder a un dashboard y manejar tus potenciales pasantes a dichas ofertas.'),
                  IOutlinedButton(text: 'SABER MÁS', event: _launchURL),
                ],
              ),
            ),
          ),
        ])));
  }
}


void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

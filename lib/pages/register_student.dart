import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/register_company.dart';
import 'package:interlab/pages/student_dashboard.dart';
import 'package:interlab/services/auth_service.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
import 'package:interlab/widgets/password_field.dart';
import 'package:interlab/widgets/register_info.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:interlab/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key key}) : super(key: key);

  @override
  _RegisterStudentState createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  AuthService authService = new AuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  bool showError = false;
  String errorMessage = 'Nombre de usuario o contraseña incorrectos';

  void _register() async {
    if (passwordController.text == retypePasswordController.text) {
      Response response = await authService.registerStudent(
          usernameController.text,
          passwordController.text,
          nameController.text);
      if (response.statusCode == 200) {
        Navigate.to(context, StudentDashboard());
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
    setShowError(false);
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
                ITopBar(text: 'Estudiante'),
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
                          hint: 'student@gmail.com',
                          showError: false)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          controller: nameController,
                          name: 'Nombres y Apellidos',
                          hint: 'Marcelo Martínez Torres',
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
                          text: 'Eres Empresa?',
                          event: () => Navigate.to(context, RegisterCompany())),
                      ITextLink(
                          text: 'Ya tienes cuenta?',
                          event: () => Navigate.to(context, Login())),
                    ],
                  ),
                  IDarkButton(
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
                      title: 'Registrándose como Estudiante:',
                      text:
                          'Te permitirá enviar solicitudes a ofertas de pasantías, acceder a un dashboard y manejar tus solicitudes en un solo lugar.'),
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

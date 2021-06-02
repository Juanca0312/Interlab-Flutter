import 'package:flutter/material.dart';
import 'package:interlab/models/authResponse.dart';
import 'package:interlab/pages/company_dashboard.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/pages/student_dashboard.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
import 'package:interlab/widgets/password_field.dart';
import 'package:interlab/widgets/register_info.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:interlab/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/services/auth_service.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = new AuthService();
  String token = '';
  bool showError = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    AuthResponse authResponse = await authService.login(
        usernameController.text, passwordController.text);

    setState(() {
      //TODO : store token and id persistently
      token = authResponse.token;
    });

    if (token != null) {
      if (authResponse.role == 'student') {
        Navigate.to(context, StudentDashboard());
      } else {
        Navigate.to(context, CompanyDashboard());
      }
    } else {
      setShowError(true);
    }
  }

  void setShowError(bool value) {
    setState(() {
      showError = value;
    });
  }

  void _onChangePassword() {
    setShowError(false);
  }

  @override
  void initState() {
    super.initState();
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
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 1,
            child: Column(
              children: [
                ITopBar(text: ''),
                IBanner(
                    title: 'Bienvenido a', hint: 'Inicia sesión en tu cuenta')
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                        controller: usernameController,
                        name: 'Nombre de usuario',
                        hint: 'student@interlab.com',
                        showError: false,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: IPasswordField(
                        controller: passwordController,
                        name: 'Contraseña',
                        hint: '••••••••••••••',
                        showError: showError,
                        errorMessage:
                            'Nombre de usuario o contraseña incorrectos',
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ITextLink(
                          text: 'Crear cuenta',
                          event: () => Navigate.to(context, RegisterStudent())),
                      ITextLink(
                          text: 'Olvidaste tu contraseña',
                          event: () => Navigate.to(context, RegisterStudent())),
                    ],
                  ),
                  IDarkButton(
                    text: 'INICIAR SESIÓN',
                    event: _login,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width * 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IRegisterInfo(title: '', text: ''),
                  IOutlinedButton(text: 'SABER MÁS', event: _launchURL),
                ]),
          ),
        ])));
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}

void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

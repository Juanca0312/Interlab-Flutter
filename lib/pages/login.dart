import 'package:flutter/material.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/pages/student_dashboard.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
import 'package:interlab/widgets/register_info.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:interlab/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:interlab/util/navigate.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class LoginPage extends StatelessWidget {
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
                          name: 'Nombre de usuario',
                          hint: 'student@interlab.com',
                          type: 'email')),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Contraseña',
                          hint: '••••••••••••••',
                          type: 'password')),
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
                    event: () => Navigate.to(context, StudentDashboard()),
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
}

void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

import 'package:flutter/material.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/pages/student_dashboard.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
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
            body: SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
          Container(
            height: 200,
            width: 600,
            color: Colors.white,
            child: Column(
              children: [
                ITopBar(text: ''),
                IBanner(
                    title: 'Bienvenido a', hint: 'Inicia sesión en tu cuenta')
              ],
            ),
          ),
          Container(
            height: 400,
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
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [IOutlinedButton(text: 'SABER MÁS', event: _launchURL)],
            ),
          ),
        ]))));
  }
}

void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

import 'package:flutter/material.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/widgets/banner.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/outlined_button.dart';
import 'package:interlab/widgets/register_info.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:interlab/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class RegisterCompany extends StatelessWidget {
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
                          name: 'Nombre de usuario',
                          hint: 'company@gmail.com',
                          type: 'email')),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Nombres y Apellidos',
                          hint: 'Ángel Velásquez',
                          type: 'text')),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Contraseña',
                          hint: '••••••••••••••',
                          type: 'password')),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Confirme su ontraseña',
                          hint: '••••••••••••••',
                          type: 'password')),
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
                  IDarkButton(
                    text: 'REGISTRARSE',
                    event: () => Navigate.to(context, Login()),
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

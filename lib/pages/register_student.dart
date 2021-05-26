import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/register_company.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/widgets/dark_button.dart';
import 'package:interlab/widgets/text_field.dart';
import 'package:interlab/widgets/text_link.dart';
import 'package:url_launcher/url_launcher.dart';

const url = 'https://8rb.github.io/Interlab-Landing-Page/';

class RegisterStudent extends StatelessWidget {
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
                Container(
                  height: 100,
                  width: 600,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/brandLogo.png',
                        width: 100.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Estudiante',
                          style: TextStyle(
                              color: IColors.dark_blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 600,
                  child: Stack(
                    children: [
                      Image.asset('assets/TitleBG.png',
                          width: 420.0, height: 550.0, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Regístrate en',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25.0),
                            ),
                            Text(
                              'Interlab',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Ingresa tus datos para continuar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 500,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Nombre de usuario',
                          hint: 'student@gmail.com',
                          type: 'email')),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: ITextField(
                          name: 'Nombres y Apellidos',
                          hint: 'Marcelo Martínez Torres',
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
                          text: 'Eres Empresa?',
                          event: () => Navigate.to(context, RegisterCompany())),
                      ITextLink(
                          text: 'Ya tienes cuenta?',
                          event: () => Navigate.to(context, LoginPage())),
                    ],
                  ),
                  IDarkButton(
                    text: 'REGISTRARSE',
                    event: () => Navigate.to(context, LoginPage()),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                    onPressed: _launchURL,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onSurface: Colors.grey,
                      shadowColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                      side: BorderSide(color: Colors.black45, width: 1),
                    ),
                    child: Text(
                      'SABER MÁS',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]))));
  }
}

void _launchURL() async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

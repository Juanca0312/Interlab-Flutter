import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/pages/company_dashboard.dart';
import 'package:interlab/pages/init.dart';
import 'package:interlab/pages/student_dashboard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: IColors.purple),
          ),
        )),
    initialRoute: '/',
    routes: {
      '/': (context) => Init(),
      '/companyDashboard': (context) => CompanyDashboard(),
      '/studentDashboard': (context) => StudentDashboard(),
    },
  ));
}

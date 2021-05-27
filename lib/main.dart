import 'package:flutter/material.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/register_company.dart';
import 'package:interlab/pages/register_student.dart';
import 'package:interlab/pages/student_dashboard.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Poppins'),
    initialRoute: '/login',
    routes: {
      '/': (context) => StudentDashboard(),
      '/studentDashboard': (context) => StudentDashboard(),
      '/login': (context) => LoginPage(),
      '/registerStudent': (context) => RegisterStudent(),
      '/registerCompany': (context) => RegisterCompany(),
    },
  ));
}

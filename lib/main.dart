import 'package:flutter/material.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/student_dashboard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Poppins'),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/studentDashboard': (context) => StudentDashboard(),
    },
  ));
}

import 'package:flutter/material.dart';
import 'package:interlab/pages/student_dashboard.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        fontFamily: 'Poppins'
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => StudentDashboard(),
    },
  ));
}

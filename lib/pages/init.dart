import 'package:flutter/material.dart';
import 'package:interlab/pages/company_dashboard.dart';
import 'package:interlab/pages/login.dart';
import 'package:interlab/pages/student_dashboard.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:interlab/util/navigate.dart';
import 'package:interlab/services/auth_service.dart';

class Init extends StatefulWidget {
  const Init({Key key}) : super(key: key);

  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  AuthService authService = new AuthService();

  Future<String> _getTokenFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<String> _getRoleFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  Future<void> _startup() async {
    final authToken = await _getTokenFromSharedPref();
    final role = await _getRoleFromSharedPref();
    await Future.delayed(Duration(seconds: 2));
    if (authToken != null) {
      if (role == 'student') {
        Navigate.replace(context, StudentDashboard());
      } else {
        Navigate.replace(context, CompanyDashboard());
      }
    } else {
      Navigate.replace(context, Login());
    }
  }

  @override
  void initState() {
    super.initState();
    _startup();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.white,
          alignment: Alignment.center,
          child: Loading())
    ])));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

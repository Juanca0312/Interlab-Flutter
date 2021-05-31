import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';

class AuthService {
  String token = "";

  Future<String> login(username, password) async {
    Response response = await post(
      Uri.parse('https://interlabapi.herokuapp.com/login'),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    Map<String, String> headers = response.headers;
    //TODO : store token persistently
    token = headers["authorization"];
    return token;
  }

  Future<Response> registerStudent(
      String username, String password, String name) async {
    Response userResponse = await post(
      Uri.parse('https://interlabapi.herokuapp.com/api/users'),
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader:
            'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'role': 'student'
      }),
    );
    print(userResponse.statusCode);
    if (userResponse.statusCode == 200) {
      Map user = jsonDecode(userResponse.body);
      String id = (user['id']).toString();
      var names = name.split(" ");
      Response profileResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$id/profiles'),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
        body: jsonEncode(<String, Object>{
          "role": "student",
          "firstName": names[0],
          "lastName": names[1],
          "field": "-",
          "phone": "-",
          "email": "-",
          "description": "-",
          "country": "-",
          "city": "-",
          "university": "-",
          "degree": "-"
        }),
      );
      print(profileResponse.statusCode);
    }
    return userResponse;
  }

  Future<Response> registerCompany(
      String username, String password, String name) async {
    Response userResponse = await post(
      Uri.parse('https://interlabapi.herokuapp.com/api/users'),
      headers: {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader:
            'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'role': 'company'
      }),
    );
    if (userResponse.statusCode == 200) {
      Map user = jsonDecode(userResponse.body);
      String id = (user['id']).toString();
      var names = name.split(" ");
      Response profileResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$id/profiles'),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
        body: jsonEncode(<String, Object>{
          "role": "company",
          "firstName": names[0],
          "lastName": names[1],
          "field": "-",
          "phone": "-",
          "email": "-",
          "description": "-",
          "country": "-",
          "city": "-",
          "university": "-",
          "degree": "-"
        }),
      );
      print(profileResponse.statusCode);
    }
    return userResponse;
  }
}

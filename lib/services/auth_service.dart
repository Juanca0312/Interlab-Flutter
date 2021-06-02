import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:interlab/models/authResponse.dart';

class AuthService {
  Future<AuthResponse> login(username, password) async {
    final authResponse = AuthResponse();
    Response tokenResponse = await post(
      Uri.parse('https://interlabapi.herokuapp.com/login'),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (tokenResponse.statusCode == 200) {
      Map<String, String> headers = tokenResponse.headers;
      authResponse.token = headers['authorization'];
      Response userResponse = await get(
        Uri.parse(
            'https://interlabapi.herokuapp.com/api/users/username/$username'),
        headers: {
          HttpHeaders.authorizationHeader: authResponse.token,
        },
      );
      Map user = jsonDecode(userResponse.body);
      authResponse.id = user['id'];
      authResponse.role = user['role'];
      authResponse.username = user['username'];
      authResponse.password = user['password'];
    }
    return authResponse;
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
          'role': 'student',
          'firstName': names[0],
          'lastName': names[1],
        }),
      );
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
          "role": "company",
          "firstName": names[0],
          "lastName": names[1],
        }),
      );
    }
    return userResponse;
  }
}

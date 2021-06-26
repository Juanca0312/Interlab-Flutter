import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:interlab/models/authResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> setCredentialsSharedPreferences(
      String token, int id, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setInt('id', id);
    await prefs.setString('role', role);
  }

  Future<void> setCredentialsSharedPreferencesCompany(
      String token, int id, int companyId, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setInt('id', id);
    await prefs.setInt('companyId', companyId);
    await prefs.setString('role', role);
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

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
      if (authResponse.role == 'company') {
        Response companyResponse = await get(
          Uri.parse(
              'https://interlabapi.herokuapp.com/api/users/${authResponse.id}/companies'),
          headers: {
            HttpHeaders.authorizationHeader: authResponse.token,
          },
        );
        Map company = jsonDecode(companyResponse.body);
        int companyId = int.parse((company['content'][0]['id']).toString());
        print('LOS IDS ${authResponse.id}, $companyId');
        setCredentialsSharedPreferencesCompany(
            authResponse.token, authResponse.id, companyId, authResponse.role);
      } else {
        setCredentialsSharedPreferences(
            authResponse.token, authResponse.id, authResponse.role);
      }
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
      int id = int.parse((user['id']).toString());
      var names = name.split(" ");
      Response tokenResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/login'),
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      Map<String, String> headers = tokenResponse.headers;
      String token = headers['authorization'];
      setCredentialsSharedPreferences(token, id, 'student');
      Response profileResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$id/profiles'),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
        body: jsonEncode(<String, Object>{
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
      int id = int.parse((user['id']).toString());
      var names = name.split(" ");
      Response tokenResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/login'),
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      Map<String, String> headers = tokenResponse.headers;
      String token = headers['authorization'];
      Response profileResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$id/profiles'),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
        body: jsonEncode(<String, Object>{
          'firstName': names[0],
          'lastName': names[1],
        }),
      );
      print(profileResponse.statusCode);
      final companyName = "$username's company";
      Response companyResponse = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies'),
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
        body: jsonEncode(<String, Object>{
          "name": companyName,
          "description": "-",
          "sector": "-",
          "email": "company@company.com",
          "phone": "+51 999 999 999",
          "address": "-",
          "country": "US",
          "city": "Cupertino, CA"
        }),
      );
      print(companyResponse.statusCode);
      Map company = jsonDecode(companyResponse.body);
      int companyId = int.parse((company['id']).toString());
      setCredentialsSharedPreferencesCompany(token, id, companyId, 'company');
      if (companyResponse.statusCode == 200) {
        Response assignResponse = await post(
          Uri.parse(
              'https://interlabapi.herokuapp.com/api/users/$id/companies/$companyId'),
          headers: {
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader:
                'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
          },
        );
        print(
          "SE ASIGNÓ CORRECTAMENTE EL USER Y EL COMPANY. CODE: ${assignResponse.statusCode}",
        );
      }
    }
    return userResponse;
  }
}

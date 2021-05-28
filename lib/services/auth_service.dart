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
}

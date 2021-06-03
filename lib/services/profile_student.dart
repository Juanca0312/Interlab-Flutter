import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

class ProfileS{
  String firstName;
  String lastName;
  String field;
  String role;
  String phone;
  String email;
  String description;
  String country;
  String city;
  String university;
  String degree;
  String semester;

  //Profile();

  Future<void> getData() async {
    try{
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/1/profiles'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );

      Map data = jsonDecode(utf8.decode(response.bodyBytes));

      firstName = data['firstName'];
      role = data['role'];
      lastName = data['lastName'];
      description = data['description'];
      email = data['email'];
      university = data['university'];
      phone = data['phone'];
      semester = data['semester'].toString();
      degree = data['degree'];
      field = data['field'];
      city = data['city'];
      country = data['country'];
      //print(data['university']);

    }
    catch(e){
      print('caught error $e');
      firstName = 'could not get name data';
    }
  }
  Future<void> updateData() async {

    final body ={
      'firstName': firstName,
      'lastName': lastName,
      'field': field,
      'phone': phone,
      'email': email,
      'description': description,
      'country': country,
      'city': city,
      "university": university,
      "degree": degree,
      "semester": int.parse(semester)
    };

    try{
      Response response = await put(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/1/profiles'),
        // Send authorization headers to the backend.
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw'
        },
        body: jsonEncode(body),
      );
      print(response.statusCode);

    }
    catch(e){
      print('caught error $e');
    }
  }
}
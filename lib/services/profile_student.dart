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
        Uri.parse('https://interlabapi.herokuapp.com/api/profiles/1'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );

      Map data = jsonDecode(response.body);

      firstName = data['firstName'];
      role = data['role'];
      lastName = data['lastName'];
      description = data['description'];
      email = data['email'];
      university = data['university'];
      phone = data['phone'];
      semester = data['semester'].toString();
      degree = data['degree'];
      //print(data['university']);

    }
    catch(e){
      print('caught error $e');
      firstName = 'could not get name data';
    }
  }
}
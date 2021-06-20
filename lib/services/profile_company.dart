import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileC {
  String nameC;
  String description;
  String sector;
  String email;
  String phone;
  String address;
  String country;
  String city;


  Future<void> getData() async {
    try {
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/1'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders
              .authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );

      Map data = jsonDecode(response.body);

      nameC = data['name'];
      description = data['description'];
      sector = data['sector'];
      email = data['email'];
      phone = data['phone'];
      address = data['address'];
      country = data['country'];
      city = data['city'];

    }
    catch (e) {
      print('caught error $e');
      nameC = 'could not get name data';
    }
  }
  Future<void> updateData() async {

    final body ={
      'name': nameC,
      'description': description,
      'sector': sector,
      'email': email,
      'phone':phone,
      'address': address,
      'country': country,
      'city': city,
    };

    try{
      Response response = await put(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/1'),
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
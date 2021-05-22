import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'dart:math';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

class Internship {
  String title;
  String company;
  String location;
  String salary;
  String description;
  int status;
  LinearGradient bgGradient;
  var rng = new Random();
  Internship({this.title, this.company, this.location, this.salary, this.description}){
    status = rng.nextInt(4);
    switch (status){
      case 0: bgGradient=IGradients.green_lightblue; break;
      case 1: bgGradient=IGradients.yellow_orange; break;
      case 2: bgGradient=IGradients.purple_pink; break;
      case 3: bgGradient=IGradients.blue_lightblue; break;
    }
  }

  Future<void> getData() async {
    try{
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/internships'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );

      Map data = jsonDecode(response.body);
      print(data['content'][1]);


    }
    catch(e){
      print('caught error $e');
      print('error');
      //firstName = 'could not get name data';
    }
  }

}
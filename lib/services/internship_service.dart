import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'dart:math';
import 'package:interlab/models/internship.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';

class InternshipService {
  List<Internship> internships = [];

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
      for(var i = 0; i<data['numberOfElements']; i++){
        internships.add(new Internship(title: data['content'][i]['jobTitle'],
        company: data['content'][i]['company']['name'],
        location: data['content'][i]['location'],
        salary: data['content'][i]['salary'].toString(),
        description: data['content'][i]['description']));
      }


    }
    catch(e){
      print('caught error $e');
      print('error');
    }
  }

}
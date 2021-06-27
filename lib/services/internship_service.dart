import 'package:interlab/models/internship.dart';
import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipService {
  List<Internship> internships = [];

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    try {
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/activeInternships'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );

      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data['numberOfElements']; i++) {
        internships.add(new Internship(
            id: data['content'][i]['id'],
            title: data['content'][i]['jobTitle'],
            company: data['content'][i]['company']['name'],
            location: data['content'][i]['location'],
            salary: data['content'][i]['salary'].toString(),
            description: data['content'][i]['description'],
            status: i,
            finishDate: data['content'][i]['finishingDate'],
            startingDate: data['content'][i]['startingDate']));
      }
    } catch (e) {
      print('caught error $e');
      print('error');
    }
  }

  Future<bool> postRequest(int internshipId) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    final userId = prefs.getInt('id');
    final body = {'state': 'pending'};
    print(
        'https://interlabapi.herokuapp.com/api/users/$userId/internships/$internshipId/request');
    try {
      Response response = await post(
          Uri.parse(
              'https://interlabapi.herokuapp.com/api/users/$userId/internships/$internshipId/request'),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': '$authToken'
          },
          body: jsonEncode(body));
      if(response.statusCode != 200){
        return false;
      }
      return true;
    } catch (e) {
      print('caught error $e');
    }
  }
}

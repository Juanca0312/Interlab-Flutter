import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:http/http.dart';
import 'package:interlab/models/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipHistoryService {
  List<Application> applicationList = [];

  Future<void> getInternshipHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id');
      Response response = await get(
        //change userId to 2, in order to showcase a user with to applications.
        Uri.parse(
            'https://interlabapi.herokuapp.com/api/users/$userId/endedRequest'),
        headers: {
          HttpHeaders.authorizationHeader:
              'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data['numberOfElements']; i++) {
        applicationList.add(
          new Application(
              data['content'][i]['jobTitle'],
              data['content'][i]['c_name'],
              data['content'][i]['c_email'],
              data['content'][i]['c_phone'],
              data['content'][i]['location'],
              data['content'][i]['state'],
              data['content'][i]['salary'].toString(),
              StringUtils.truncate(data['content'][i]['startingDate'], 10,
                  symbol: ''),
              StringUtils.truncate(data['content'][i]['finishingDate'], 10,
                  symbol: ''),
              data['content'][i]['description']),
        );
      }
    } catch (e) {
      print('caught error $e');
    }
  }
}

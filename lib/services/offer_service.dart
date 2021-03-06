import 'dart:convert';
import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:http/http.dart';
import 'package:interlab/models/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfferService {
  List<Application> offerList = [];

  Future<void> getData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final companyId = prefs.getInt('companyId');
      final token = prefs.getString('authToken');
      Response response = await get(
        Uri.parse(
            'https://interlabapi.herokuapp.com/api/companies/$companyId/internships'),
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < data['numberOfElements']; i++) {
        offerList.add(
          new Application(
              data['content'][i]['id'],
              data['content'][i]['jobTitle'],
              data['content'][i]['company']['name'],
              data['content'][i]['company']['email'],
              data['content'][i]['company']['phone'],
              data['content'][i]['location'],
              data['content'][i]['state'],
              data['content'][i]['salary'].toString(),
              StringUtils.truncate(data['content'][i]['startingDate'], 10, symbol: ''),
              StringUtils.truncate(data['content'][i]['finishingDate'], 10, symbol: ''),
              data['content'][i]['description']
          ),
        );
      }
    }
    catch(e){
      print('caught error $e');
    }
  }

  Future<void> getActiveInternships() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final companyId = prefs.getInt('companyId');
      final token = prefs.getString('authToken');
      Response response = await get(
        //change userId to 2, in order to showcase a user with to applications.
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/$companyId/activeInternships'),
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      for(var i = 0; i<data['numberOfElements']; i++){
        offerList.add(
          new Application(
              data['content'][i]['id'],
              data['content'][i]['jobTitle'],
              data['content'][i]['company']['name'],
              data['content'][i]['company']['email'],
              data['content'][i]['company']['phone'],
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

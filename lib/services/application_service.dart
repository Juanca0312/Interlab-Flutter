import 'dart:convert';
import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:http/http.dart';
import 'package:interlab/models/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationService{
  List<Application> applicationList=[];

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id');
    final authToken = prefs.getString('authToken');
    try {
      Response response = await get(
        //change userId to 2, in order to showcase a user with to applications.
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$userId/requests'),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      for(var i = 0; i<data['numberOfElements']; i++){
        if(data['content'][i]['requestState'].toLowerCase()  != "ended" && data['content'][i]['requestState'].toLowerCase() != "rejected"){
          applicationList.add(
            new Application(
                data['content'][i]['id'],
                data['content'][i]['jobTitle'],
                data['content'][i]['c_name'],
                data['content'][i]['c_email'],
                data['content'][i]['c_phone'],
                data['content'][i]['location'],
                data['content'][i]['requestState'],
                data['content'][i]['salary'].toString(),
                StringUtils.truncate(data['content'][i]['startingDate'], 10, symbol: ''),
                StringUtils.truncate(data['content'][i]['finishingDate'], 10, symbol: ''),
                data['content'][i]['description']
            ),
          );
        }
      }
    }
    catch(e){
      print('caught error $e');
    }
  }
}
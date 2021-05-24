import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:http/http.dart';
import 'package:interlab/models/historic_application.dart';

class HistoricApplicationService{
  List<HistoricApplication> historicApplicationList=[];

  Future<void> getData() async {
    try {
      Response response = await get(
        //change userId to 2, in order to showcase a user with to applications.
        Uri.parse('https://interlabapi.herokuapp.com/api/users/1/internships'),
        headers: {
          HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );
      Map data = jsonDecode(response.body);
      for(var i = 0; i<data['numberOfElements']; i++){
        historicApplicationList.add(
          new HistoricApplication(
            data['content'][i]['company']['name'],
            StringUtils.truncate(data['content'][i]['startingDate'], 10, symbol: '')
          ),
        );
      }
    }
    catch(e){
      print('caught error $e');
    }
  }
}
import 'dart:convert';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:http/http.dart';
import 'package:interlab/models/history_company.dart';


class HistoryCompanyService{
  List<HistoryCompany> historyCompanyList=[];

  Future<void> getData() async{
    try {
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/1/endedInternships'),
        headers: {
          HttpHeaders.authorizationHeader: 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwaXRpIn0.Zq4fRNnpFFzaC0nuNopJuU3EHciKTk4H2XsQU8wY6wZVqnw_Xdfl4sDjjSks4lAarh1mf06bwS8wOb06LzFGuw',
        },
      );
      Map data = jsonDecode(response.body);
      for(var i = 0; i<data['numberOfElements']; i++){
        historyCompanyList.add(
          new HistoryCompany(
            data['content'][i]['firstName'],
            data['content'][i]['lastName'],
            StringUtils.truncate(data['content'][i]['finishingDate'], 10,
                symbol: ''),
            StringUtils.truncate(data['content'][i]['startingDate'], 10,
                symbol: ''),
            data['content'][i]['state'],
            data['content'][i]['salary'].toString(),
            data['content'][i]['i_description'],
            data['content'][i]['jobTitle'],
            data['content'][i]['email'],
            data['content'][i]['phone'],
            data['content'][i]['city'],

          ),
        );
      }
    }
    catch(e){
      print('caught error $e');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart';
import 'package:interlab/models/company_offer.dart';

class CompanyOfferService{
  CompanyOffer companyOffer;

  Future<void> createData() async {
    final body = {
      'state': companyOffer.status,
      'description': companyOffer.description,
      'startingDate': companyOffer.startingDate,
      'finishingDate': companyOffer.finishingDate,
      'salary': companyOffer.salary,
      'location': companyOffer.location,
      'jobTitle': companyOffer.title
    };
    try {
      Response response = await post(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/1/internships'),
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
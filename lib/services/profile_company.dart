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
      final prefs = await SharedPreferences.getInstance();
      final companyId = prefs.getInt('companyId');
      print(companyId);
      final token = prefs.getString('authToken');
      Response response = await get(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/$companyId'),
        // Send authorization headers to the backend.
        headers: {
          HttpHeaders.authorizationHeader: token,
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

    } catch (e) {

      print('caught error $e');
      nameC = 'could not get name data';
    }
  }

  Future<void> updateData() async {
    final body = {
      'name': nameC,
      'description': description,
      'Sector': sector,
      'email': email,
      'phone': phone,
      'address': address,
      'phone': phone,
      'country': country,
      'city': city,
    };

    try {
      final prefs = await SharedPreferences.getInstance();
      final companyId = prefs.getInt('companyId');
      final token = prefs.getString('authToken');
      Response response = await put(
        Uri.parse('https://interlabapi.herokuapp.com/api/companies/$companyId'),
        // Send authorization headers to the backend.
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': token
        },
        body: jsonEncode(body),
      );
      print(response.statusCode);
    } catch (e) {
      print('caught error $e');
    }
  }
}

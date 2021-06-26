import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:interlab/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentsService{
  List<Student> students= [];

  Future<void> selectStudent(int userId, int internshipId) async{
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    try{
      Response response = await put(
        Uri.parse('https://interlabapi.herokuapp.com/api/users/$userId/internships/$internshipId'),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      print(response.statusCode);
    }
    catch(e){
      print('caught error $e');
    }
  }

  Future<void> getData(int internshipId) async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('authToken');
    try {
      Response response = await get(
        //change userId to 2, in order to showcase a user with to applications.
        Uri.parse('https://interlabapi.herokuapp.com/api/internships/$internshipId/profiles'),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      Map data = jsonDecode(utf8.decode(response.bodyBytes));
      print(internshipId);
      print(response.statusCode);
      for(var i = 0; i<data['totalElements']; i++){
        Student student = Student.empty();
        student.username = data['content'][i]['username'];
        student.userId = data['content'][i]['userId'];
        student.password = data['content'][i]['password'];
        student.role = data['content'][i]['role'];
        student.profileId = data['content'][i]['profileId'];
        student.firstName = data['content'][i]['firstName'];
        student.lastName = data['content'][i]['lastName'];
        student.field = data['content'][i]['field'];
        student.phone = data['content'][i]['phone'];
        student.email = data['content'][i]['email'];
        student.description = data['content'][i]['description'];
        student.country = data['content'][i]['country'];
        student.city = data['content'][i]['city'];
        student.university = data['content'][i]['university'];
        student.degree = data['content'][i]['degree'];
        student.semester = data['content'][i]['semester'];

        students.add(student);
      }
    }
    catch(e){
      print('caught error $e');
    }
  }
}
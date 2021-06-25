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
        /*print(data['content'][i]['userId'].toString(),);
        print(data['content'][i]['username'],);
        print(data['content'][i]['password'],);
        print(data['content'][i]['profileId'].toString(),);
        print(data['content'][i]['firstName'],);
        print(data['content'][i]['lastName'],);
        print(data['content'][i]['field'],);
        print(data['content'][i]['role'],);
        print(data['content'][i]['phone'],);
        print(data['content'][i]['email'],);
        print(data['content'][i]['description'],);
        print(data['content'][i]['country'],);
        print(data['content'][i]['city'],);
        print(data['content'][i]['university'],);
        print(data['content'][i]['degree'],);
        print(data['content'][i]['semester'],);*/

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
      Student student = Student.empty();
      student.username = 'juan';
      student.userId = 1;
      student.password = 'contra';
      student.role = 'student';
      student.profileId = 1;
      student.firstName = 'Juan';
      student.lastName = 'Hernandez';
      student.field = 'Tech';
      student.phone = '987436576';
      student.email = 'email@email.com';
      student.description = 'description larga lorem monriejrne  rjgoierg erg erg ergerg erg erg erg eg er gegoijosidj  adsf';
      student.country = 'Peru';
      student.city = 'Lima';
      student.university = 'UPC';
      student.degree = 'Ingenieria de Software';
      student.semester = 4;


      students.add(student);
      student.username = 'juan';
      student.userId = 1;
      student.password = 'contra';
      student.role = 'student';
      student.profileId = 1;
      student.firstName = 'Juan';
      student.lastName = 'Hernandez';
      student.field = 'Tech';
      student.phone = '987436576';
      student.email = 'email@email.com';
      student.description = 'description larga lorem monriejrne  rjgoierg erg erg ergerg erg erg erg eg er gegoijosidj  adsf';
      student.country = 'Peru';
      student.city = 'Lima';
      student.university = 'UPC';
      student.degree = 'Ingenieria de Software';
      student.semester = 4;


      students.add(student);
      student.username = 'juan';
      student.userId = 1;
      student.password = 'contra';
      student.role = 'student';
      student.profileId = 1;
      student.firstName = 'Juan';
      student.lastName = 'Hernandez';
      student.field = 'Tech';
      student.phone = '987436576';
      student.email = 'email@email.com';
      student.description = 'description larga lorem monriejrne  rjgoierg erg erg ergerg erg erg erg eg er gegoijosidj  adsf';
      student.country = 'Peru';
      student.city = 'Lima';
      student.university = 'UPC';
      student.degree = 'Ingenieria de Software';
      student.semester = 4;


      students.add(student);
      print('caught error $e');
    }
  }


}
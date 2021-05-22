import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:interlab/pages/student_profile.dart';
import 'package:interlab/widgets/interlab_student_app_bar.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key key}) : super(key: key);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {

  static int _currentIndex = 1;
  static double height;

  final tabs = [
    Center(child: Text('Home'),),
    Profile(subtitle: _currentIndex),
    Center(child: Text('History'),),
    Center(child: Text('Search'),),
  ];


  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height * 0.15;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: InterlabStudentAppBar(index: _currentIndex, height: height,),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(child: tabs[_currentIndex])
      ),
      bottomNavigationBar: DotNavigationBar(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [

          DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Colors.grey[900],
              unselectedColor: Colors.grey[500]
          ),


          DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Colors.grey[900],
              unselectedColor: Colors.grey[500]
          ),


          DotNavigationBarItem(
              icon: Icon(Icons.access_time),
              selectedColor: Colors.grey[900],
              unselectedColor: Colors.grey[500]
          ),


          DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Colors.grey[900],
              unselectedColor: Colors.grey[500]

          ),
        ],
      ),
    );
  }

}

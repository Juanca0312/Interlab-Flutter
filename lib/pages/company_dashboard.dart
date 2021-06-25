import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:interlab/pages/company_history.dart';
import 'package:interlab/pages/company_home.dart';
import 'package:interlab/pages/company_offer.dart';
import 'package:interlab/pages/company_profile.dart';
import 'package:interlab/widgets/interlab_recruiter_app_bar.dart';


class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({Key key}) : super(key: key);

  @override
  _CompanyDashboardState createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends State<CompanyDashboard> {

  static int _currentIndex = 0;
  static double height;

  final tabs = [
    CompanyHome(),
    CProfile(),
    History(),
    Offer(),
  ];


  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height * 0.15;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: InterlabRecruiterAppBar(index: _currentIndex, height: height,),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: EdgeInsets.only(top: height*1.2),
            child: Center(child: tabs[_currentIndex]),
          )
      ),
      bottomNavigationBar: DotNavigationBar(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
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
              icon: Icon(Icons.add_circle_outline_rounded),
              selectedColor: Colors.grey[900],
              unselectedColor: Colors.grey[500]

          ),
        ],
      ),
    );
  }
}



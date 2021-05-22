import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Application> mockApplications=[
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Active'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Rejected'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Pending'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Pending'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Pending'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Pending'),
    new Application('Summer Internship 2021', 'Empresa ACME', 'Palo Alto, CA', 'Pending'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockApplications.length,
        itemBuilder: (BuildContext context, int i) {
          return _buildRow(mockApplications[i]);
        }
    );
  }
  Widget _buildRow(Application application){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: applicationWidget(application),
    );
  }
  Widget applicationWidget(Application application){
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  application.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${application.company} - ${application.location}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 17),
                child: Text(
                  application.status,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: application.bgGradient,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(5, 5),
            ),
          ]
      ),
    );
  }
}

class Application {
  String title;
  String company;
  String location;
  String status;
  LinearGradient bgGradient;
  Application(this.title, this.company, this.location, this.status){
    switch (status){
      case 'Active': bgGradient=LinearGradient(colors: [Colors.green, Colors.lightGreen]); break;
      case 'Rejected': bgGradient=LinearGradient(colors: [Colors.yellow, Colors.yellowAccent]); break;
      case 'Pending': bgGradient=LinearGradient(colors: [Colors.purple, Colors.pink]); break;
    }
  }
}

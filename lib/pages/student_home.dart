import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:interlab/models/application.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:interlab/pages/student_application_details.dart';
import 'package:interlab/services/application_service.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/widgets/student_home_empty.dart';
import 'package:share/share.dart';
class Home extends StatefulWidget {
  const Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApplicationService applicationService=new ApplicationService();
  List<Application> applications=[];
  bool loading=true;

  void getData() async {
    await applicationService.getData();
    assignData();
  }
  void assignData(){
    loading=false;
    setState(() {
      applications=applicationService.applicationList;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void setState(VoidCallback fn) {
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :
    applications.isEmpty ? StudentHomeEmpty() : ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: applications.length,
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(applications[i]);
      }
    );
  }

  Widget _buildRow(Application application){
    return GestureDetector(
      onTap: () =>
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return StudentApplicationDetails(application);
          },
          animationType: DialogTransitionType.slideFromBottom,
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500)
        ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: applicationWidget(application),
      ),
    );
  }
  Widget applicationWidget(Application application){
    return Container(
      padding: EdgeInsets.only(left: 20),
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
            padding: EdgeInsets.only(right: 17),
            child: Text(
              StringUtils.capitalize(application.status),
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.white,
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
      decoration: BoxDecoration(
        gradient: application.bgGradient,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ]
      ),
    );
  }
  void share(BuildContext context, Application application)
  {
    final  RenderBox box = context.findRenderObject();
    final String text = "${application.description} ";
    Share.share(text,subject: application.description,
    sharePositionOrigin: box.localToGlobal(Offset.zero)& box.size);


  }
}

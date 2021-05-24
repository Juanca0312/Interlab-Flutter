import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/models/historic_application.dart';
import 'package:interlab/services/historic_application_service.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/widgets/student_history_empty.dart';
import 'package:ms_undraw/illustrations.g.dart';
import 'package:ms_undraw/ms_undraw.dart';
class History extends StatefulWidget {
  const History();

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistoricApplicationService historicApplicationService=new HistoricApplicationService();
  List<HistoricApplication> historicApplications=[];
  bool loading=true;

  void getData() async {
    await historicApplicationService.getData();
    assignData();
  }
  void assignData(){
    loading=false;
    setState(() {
      historicApplications=historicApplicationService.historicApplicationList;
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
    historicApplications.isEmpty ? StudentHistoryEmpty() : Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Container(
        child: ClipRRect(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              tableTitleWidget(),
              Expanded(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: historicApplications.length+1,
                    itemBuilder: (BuildContext context, int i){
                      if (i==historicApplications.length){
                        return _buildIllustration();
                      }
                      return _buildRow(historicApplications[i], i);
                    }
                  ),
                ),
              ),
            ],
          ),
          //To clip the border radius, since Container does not clip inside elements
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(5, 5),
            ),
          ],
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
        )
      ),
    );
  }
  Widget _buildRow(HistoricApplication historicApplication, int i){
    return historicApplicationWidget(historicApplication, i);
  }
  Widget _buildIllustration(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: UnDraw(illustration: UnDrawIllustration.back_home, color: IColors.lightblue, height: 100,),
    );
  }
  Widget historicApplicationWidget(HistoricApplication historicApplication, int i){
    return Container(
      color: Colors.grey[50+250*(i%2)],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              historicApplication.company,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            Text(
              historicApplication.hiringDate,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget tableTitleWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Empresa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            ),
            Text(
              'Contratación',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: IGradients.yellow_orange
      ),
    );
  }
}
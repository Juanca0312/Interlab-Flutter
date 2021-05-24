import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/models/historic_application.dart';
import 'package:interlab/services/historic_application_service.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/widgets/student_history_empty.dart';
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
              Container(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: historicApplications.length,
                    itemBuilder: (BuildContext context, int i){
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
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:interlab/models/application.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:interlab/services/offer_service.dart';
import 'package:interlab/widgets/active_internships_card.dart';
import 'package:interlab/widgets/loading.dart';
import 'package:interlab/widgets/company_home_empty.dart';
class CompanyHome extends StatefulWidget {
  const CompanyHome();

  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  OfferService offerService=new OfferService();
  List<Application> offers=[];
  bool loading=true;

  void getData() async {
    await offerService.getActiveInternships();
    assignData();
  }
  void assignData(){
    loading=false;
    setState(() {
      offers=offerService.offerList;
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
    offers.isEmpty ? CompanyHomeEmpty() : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int i) {
          return _buildRow(offers[i]);
        }
    );
  }

  Widget _buildRow(Application offer){
    return GestureDetector(
      onTap: () =>
          showAnimatedDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return RequestsStudentsCard(offer);
              },
              animationType: DialogTransitionType.slideFromBottom,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500)
          ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 21),
        child: offerWidget(offer),
      ),
    );
  }
  Widget offerWidget(Application offer){
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                '${offer.company} - ${offer.location}',
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
              StringUtils.capitalize(offer.status),
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
          gradient: offer.bgGradient,
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
}

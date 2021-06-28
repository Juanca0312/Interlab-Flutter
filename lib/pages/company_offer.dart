import 'dart:async';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'package:interlab/models/company_offer.dart';
import 'package:interlab/services/company_offer_service.dart';
import 'package:interlab/widgets/successful_create_company_offer.dart';
import 'package:interlab/widgets/text_form_input.dart';

class Offer extends StatefulWidget {
  const Offer({Key key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  String title;

  final TextEditingController titleC = new TextEditingController();
  final TextEditingController descriptionC = new TextEditingController();
  final TextEditingController startingDateC = new TextEditingController();
  final TextEditingController finishingDateC = new TextEditingController();
  final TextEditingController locationC = new TextEditingController();
  final TextEditingController salaryC = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CompanyOfferService service=new CompanyOfferService();

  final ScrollController _scrollController=new ScrollController();

  void createData() async {
    CompanyOffer companyOffer=new CompanyOffer(titleC.text, descriptionC.text, startingDateC.text, finishingDateC.text, locationC.text, StringUtils.removeExp(salaryC.text, 'S/ '));
    service.companyOffer=companyOffer;
    await service.createData();
  }

  void resetFields(){
    titleC.text='';
    descriptionC.text='';
    startingDateC.text='';
    finishingDateC.text='';
    locationC.text='';
    salaryC.text='S/ ';
    _scrollToTop();
  }

  @override
  void initState() {
    salaryC.text='S/ ';
    super.initState();
  }

  void _scrollToTop(){
    _scrollController.animateTo(_scrollController.position.minScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Container(
          child: ClipRRect(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: RawScrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                radius: Radius.circular(10),
                thumbColor: IColors.blue,
                thickness: 4,
                child: ListView(
                  controller: _scrollController,
                    children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ITextFormInput(
                            textController: titleC,
                            label: 'Título de la oferta',
                            hint: 'Ex. UI Design Intern',
                            errorMessage: 'Ups! Ingrese un título para la oferta',
                          ),
                          ITextFormInput(
                            textController: descriptionC,
                            label: 'Descripción de la oferta',
                            hint: 'Ex. Posición, función...',
                            errorMessage: 'Ingrese la descripción de la oferta!',
                          ),
                          ITextFormInput(
                            textController: startingDateC,
                            label: 'Fecha de inicio',
                            hint: 'dd/mm/aaaa',
                            errorMessage: 'Ingrese la fecha de inicio: dd/mm/aaaa',
                          ),
                          ITextFormInput(
                            textController: finishingDateC,
                            label: 'Fecha de fin',
                            hint: 'dd/mm/aaaa',
                            errorMessage: 'Ingrese la fecha de fin: dd/mm/aaaa',
                          ),
                          ITextFormInput(
                            textController: locationC,
                            label: 'Ubicación del trabajo',
                            hint: 'Ex. Surco, Lima',
                            errorMessage: 'Ingrese la ubicación del trabajo',
                          ),
                          ITextFormInput(
                            textController: salaryC,
                            label: 'Salario mensual',
                            hint: 'Ex. S/ 3000',
                            numeric: true,
                            errorMessage: 'Ingrese el salario mensual de la oferta',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if(_formKey.currentState.validate()){
                                String tempTitle=titleC.text;
                                createData();
                                resetFields();
                                _scrollToTop();
                                Timer timer = Timer(Duration(milliseconds: 3000), (){
                                  Navigator.of(context, rootNavigator: true).pop();
                                });
                                showAnimatedDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (BuildContext context) {
                                      return SuccessfulCreateCompanyOffer(title: tempTitle,);
                                    },
                                    animationType: DialogTransitionType.slideFromBottom,
                                    curve: Curves.fastOutSlowIn,
                                    duration: Duration(milliseconds: 500)
                                ).then((value){
                                  // dispose the timer in case something else has triggered the dismiss.
                                  timer?.cancel();
                                  timer = null;
                                });
                              }
                              else{
                                _scrollToTop();
                              }
                            },
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 60, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Crear oferta',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                height: 50,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: IGradients.purple_pink,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
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
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );
  }
}

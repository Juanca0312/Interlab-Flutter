import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class Offer extends StatefulWidget {
  const Offer({Key key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  String title;

  final TextEditingController _titleC = new TextEditingController();
  final TextEditingController _descriptionC = new TextEditingController();
  final TextEditingController _startingDateC = new TextEditingController();
  final TextEditingController _finishingDateC = new TextEditingController();
  final TextEditingController _locationC = new TextEditingController();
  final TextEditingController _salaryC = new TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Container(
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _titleC,
                          decoration:
                              InputDecoration(labelText: 'Título de la oferta'),
                        ),
                        TextFormField(
                          controller: _descriptionC,
                          decoration: InputDecoration(
                              labelText: 'Descripción de la oferta'),
                        ),
                        TextFormField(
                          controller: _startingDateC,
                          decoration:
                              InputDecoration(labelText: 'Fecha de inicio'),
                        ),
                        TextFormField(
                          controller: _finishingDateC,
                          decoration: InputDecoration(labelText: 'Fecha de fin'),
                        ),
                        TextFormField(
                          controller: _locationC,
                          decoration:
                              InputDecoration(labelText: 'Ubicación del trabajo'),
                        ),
                        TextFormField(
                          controller: _salaryC,
                          decoration:
                              InputDecoration(labelText: 'Salario mensual'),
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: (){
                            print(_titleC.text);
                          },
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.check_rounded, color: Colors.white,),
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
                        SizedBox(height: 20,),
                      ],
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

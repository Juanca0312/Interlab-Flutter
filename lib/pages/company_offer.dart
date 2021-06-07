import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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

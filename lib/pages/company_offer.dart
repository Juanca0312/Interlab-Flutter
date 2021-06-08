import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/colors/interlab_gradients.dart';
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
                isAlwaysShown: true,
                radius: Radius.circular(10),
                thumbColor: IColors.blue,
                child: ListView(children: [
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
                          ),
                          ITextFormInput(
                            textController: descriptionC,
                            label: 'Descripción de la oferta',
                            hint: '',
                          ),
                          ITextFormInput(
                            textController: startingDateC,
                            label: 'Fecha de inicio',
                            hint: 'dd/mm/aaaa',
                          ),
                          ITextFormInput(
                            textController: finishingDateC,
                            label: 'Fecha de fin',
                            hint: 'dd/mm/aaaa',
                          ),
                          ITextFormInput(
                            textController: locationC,
                            label: 'Ubicación del trabajo',
                            hint: 'Ex. Surco - Lima',
                          ),
                          ITextFormInput(
                            textController: salaryC,
                            label: 'Salario mensual',
                            hint: 'Ex. S/ 3000',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              print(titleC.text);
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

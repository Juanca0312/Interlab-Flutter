import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/models/application.dart';
import 'package:interlab/models/student.dart';
import 'package:interlab/services/students_service.dart';

class RequestsStudentsCard extends StatefulWidget {
  final Application offer;
  const RequestsStudentsCard(this.offer);

  @override
  _RequestsStudentsCardState createState() => _RequestsStudentsCardState();
}

class _RequestsStudentsCardState extends State<RequestsStudentsCard> {
  StudentsService service = StudentsService();
  List<Student> students = [];

  void getData() async {
    await service.getData(widget.offer.internshipId);
    assignData();
  }

  void assignData() {
    setState(() {
      students = service.students;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.offer.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '${widget.offer.company} - ${widget.offer.location}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          '${widget.offer.companyEmail} - ${widget.offer.companyPhone}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 100,
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            StringUtils.capitalize(widget.offer.status),
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Since: ${widget.offer.startingDate}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.white54,
                            ),
                          ),
                          Text(
                            'To: ${widget.offer.finishingDate}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.white54,
                            ),
                          ),
                        ],
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
                gradient: widget.offer.bgGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: students.length,
                itemBuilder: (BuildContext context, int i) {
                  return CardStudent(students[i], widget.offer.internshipId);
                }),
          ),
        ],
      ),
    );
  }
}

class CardStudent extends StatelessWidget {
  final Student student;
  final int internshipId;

  CardStudent(this.student, this.internshipId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            //border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(4, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFE3E3E3),
                        //border: Border.all(color: Colors.black),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ciclo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${student.semester}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          //border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${student.city},',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${student.country}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${student.firstName} ${student.lastName} ',
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${student.email} ',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${student.phone} ',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${student.university} ',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${student.degree} ',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        InkWell(
                          onTap: (){
                            StudentsService service = StudentsService();
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Reclutar?'),
                                  content: Text('Estas a punto de reclutar a ${student.firstName} ${student.lastName}'),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: IColors.green),
                                        ),
                                        height: 30,
                                        width: 80,
                                        child: Center(
                                            child: Text(
                                              'Cancelar',
                                              style: TextStyle(
                                                  color: Colors.grey[800], fontSize: 16),
                                            )),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        service.selectStudent(student.userId, internshipId);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: IColors.green,
                                            borderRadius: BorderRadius.circular(10)),
                                        height: 30,
                                        width: 80,
                                        child: Center(
                                            child: Text(
                                              'Reclutar',
                                              style:
                                              TextStyle(color: Colors.black, fontSize: 16),
                                            )),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: IColors.green,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              width: 200,
                              height: 30,
                              child: Center(child: Text('Seleccionar Pasante', style: TextStyle(fontWeight: FontWeight.w600),)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

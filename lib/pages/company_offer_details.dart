import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_colors.dart';
import 'package:interlab/models/application.dart';
import 'package:interlab/widgets/title_and_content_with_icon.dart';
import 'package:ms_undraw/ms_undraw.dart';

class CompanyOfferDetails extends StatefulWidget {
  final Application offer;
  const CompanyOfferDetails(this.offer);

  @override
  _CompanyOfferDetailsState createState() => _CompanyOfferDetailsState();
}

class _CompanyOfferDetailsState extends State<CompanyOfferDetails> {
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
                )
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 15,),
                TitleAndContentWithIcon("Descripción", widget.offer.description, Icons.description, IColors.blue),
                TitleAndContentWithIcon("Salario", 'S/ ${widget.offer.salary}', Icons.payments, IColors.pink),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: UnDraw(illustration: UnDrawIllustration.launching, color: IColors.lightblue)
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

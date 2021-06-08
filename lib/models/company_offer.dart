import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class CompanyOffer {
  String title;
  String description;
  String startingDate;
  String finishingDate;
  String location;
  String salary;
  String status;
  LinearGradient bgGradient;
  CompanyOffer(this.title, this.description, this.startingDate, this.finishingDate, this.location, this.salary){
    this.status="Active";
    bgGradient=IGradients.green_lightblue;
  }
}
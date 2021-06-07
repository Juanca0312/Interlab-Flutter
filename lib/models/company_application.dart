import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class CompanyApplication {
  String title;
  String description;
  String startingDate;
  String finishingDate;
  String location;
  String salary;
  String status;
  LinearGradient bgGradient;
  CompanyApplication(this.title, this.description, this.startingDate, this.finishingDate, this.location, this.salary, this.status){
    this.status="Active";
    bgGradient=IGradients.green_lightblue;
  }
}
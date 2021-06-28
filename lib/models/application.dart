import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class Application {
  int internshipId;
  String title;
  String company;
  String companyEmail;
  String companyPhone;
  String location;
  String status;
  String salary;
  String startingDate;
  String finishingDate;
  String description;
  LinearGradient bgGradient;
  Application(this.internshipId, this.title, this.company, this.companyEmail, this.companyPhone, this.location, this.status, this.salary, this.startingDate, this.finishingDate, this.description){
    switch (status){
      case 'Active':
      case 'active': bgGradient=IGradients.green_lightblue; break;
      case 'Rejected':
      case 'rejected': bgGradient=IGradients.yellow_orange; break;
      case 'Pending':
      case 'pending': bgGradient=IGradients.purple_pink; break;
      case 'Ended':
      case 'ended': bgGradient=IGradients.lightblue_blue; break;
    }
  }
}
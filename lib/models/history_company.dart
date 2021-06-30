import 'package:flutter/cupertino.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class HistoryCompany{
  String firstName;
  String lastName;
  String finishingDate;
  String startingDate;
  String status;
  String salary;
  String i_description;
  String jobTitle;
  String email;
  String phone;
  String city;
  LinearGradient bgGradient;

  HistoryCompany(this.firstName, this.lastName, this.finishingDate,this.startingDate,this.status, this.salary, this.i_description,
      this.jobTitle, this.email, this.phone, this.city){

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
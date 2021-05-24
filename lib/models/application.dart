import 'package:flutter/cupertino.dart';
import 'package:interlab/colors/interlab_gradients.dart';

class Application {
  String title;
  String company;
  String location;
  String status;
  LinearGradient bgGradient;
  Application(this.title, this.company, this.location, this.status){
    switch (status){
      case 'Active':
      case 'active': bgGradient=IGradients.green_lightblue; break;
      case 'Rejected':
      case 'rejected': bgGradient=IGradients.yellow_orange; break;
      case 'Pending':
      case 'pending': bgGradient=IGradients.purple_pink; break;
    }
  }
}
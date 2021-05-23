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
      case 'Active': bgGradient=IGradients.green_lightblue; break;
      case 'Rejected': bgGradient=IGradients.yellow_orange; break;
      case 'Pending': bgGradient=IGradients.purple_pink; break;
    }
  }
}
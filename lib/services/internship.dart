import 'package:flutter/material.dart';
import 'package:interlab/colors/interlab_gradients.dart';
import 'dart:math';
class Internship {
  String title;
  String company;
  String location;
  String salary;
  String description;
  int status;
  LinearGradient bgGradient;
  var rng = new Random();
  Internship({this.title, this.company, this.location, this.salary, this.description}){
    status = rng.nextInt(4);
    switch (status){
      case 0: bgGradient=IGradients.green_lightblue; break;
      case 1: bgGradient=IGradients.yellow_orange; break;
      case 2: bgGradient=IGradients.purple_pink; break;
      case 3: bgGradient=IGradients.blue_lightblue; break;
    }
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TextBox extends StatelessWidget {

  final String placeHolder;
  final TextInputType keyboardType;
  //final TextField textField;//cambiar luego

  const TextBox({
    Key key,
   // this.textField,
    this.keyboardType = TextInputType.text ,
    this.placeHolder
    }): super(key: key);

  @override
  Widget build(BuildContext context){

    return TextFormField(
      keyboardType:keyboardType,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
      maxLines: 10,
    );
  }
}

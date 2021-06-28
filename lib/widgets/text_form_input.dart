import 'package:flutter/material.dart';

class ITextFormInput extends StatelessWidget {
  const ITextFormInput({Key key,this.textController, this.label, this.hint, this.numeric=false, this.errorMessage}): super(key: key);
  final String label;
  final String hint;
  final String errorMessage;
  final bool numeric;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        TextFormField(
          controller: textController,
          style: TextStyle(fontSize: 18),
          validator: (value){
            if(value==null || value.isEmpty){
              return errorMessage;
            }
            return null;
          },
          keyboardType: numeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15, -2, 15, 5),
              hintText: hint
          ),
        ),
        SizedBox(height: 25,)
      ],
    );
  }
}


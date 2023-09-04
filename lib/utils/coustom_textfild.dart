import 'package:flutter/material.dart';
class CustTextFiled extends StatelessWidget {
  String? labelText;
  TextEditingController? controlle;
  CustTextFiled({Key? key,required this.labelText,required this.controlle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlle,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}

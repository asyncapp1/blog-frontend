import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustBtn extends StatelessWidget {
  double height;
  double width;
  String text;
  VoidCallback onPressed;

  CustBtn(
      {Key? key,
      required this.width,
      required this.height,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.orangeAccent,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onPressed);
  }
}

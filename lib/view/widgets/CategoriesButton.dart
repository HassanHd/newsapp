import 'package:flutter/material.dart';
import 'package:neewsaap/constant.dart';
import 'package:neewsaap/view/screens/catagrescreen.dart';

class CategoriesButton extends StatelessWidget {
  Color buttoncolor;
  String buttonText;

  CategoriesButton({required this.buttoncolor, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return CatagreScreen(buttonText);
          }));
        },
        color: buttoncolor,
        child: Text("$buttonText"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

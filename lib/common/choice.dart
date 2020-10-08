import 'package:flutter/material.dart';


class Choice extends StatefulWidget {
  final String label;

  Choice({this.label});

  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool check = false;
  Color textcolor = Color(0xff072ac8);
  Color backcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FlatButton(
        child: Text(
          widget.label,
          style: TextStyle(fontFamily: 'SourceSansPro', fontSize: 15),
        ),
        onPressed: () {
          check = check ? false : true;
          setState(() {
            textcolor = check ? Colors.white : Color(0xff072ac8);
            backcolor = check ? Color(0xff072ac8) : Colors.white;
          });
        },
        textColor: textcolor,
        color: backcolor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Color(0xff072ac8))),
      ),
    );
  }
}

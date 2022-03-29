import 'package:flutter/material.dart';

class CustomCheckboxErrState extends StatefulWidget {
  const CustomCheckboxErrState({Key? key}) : super(key: key);

  @override
  __CustomCheckboxErrStateState createState() => __CustomCheckboxErrStateState();
}

class __CustomCheckboxErrStateState extends State<CustomCheckboxErrState> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checked = !_checked;
        });
      },
      child: 
      Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
        child: Container(
            //padding: EdgeInsets.only(left: 5.0),
            decoration: BoxDecoration(
                color: _checked ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
                border: _checked
                    ? Border.all(color: Colors.black, width: 2.0)
                    : Border.all(color: Colors.black, width: 2.0)),
            width: 25,
            height: 25,
            child: _checked ? Icon(Icons.check, color: Colors.white) : null),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/presentation/view/global.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:flutter_application_1/presentation/widgets/check_box.dart';
import 'package:flutter_application_1/presentation/widgets/check_passed_standar_dimension.dart';
import 'package:flutter_application_1/presentation/widgets/widget.dart';

class RadioMethod extends StatefulWidget {
  List<Standard> standar;
  RadioMethod(this.standar);
  //static bool visiblecontain = false;
  //const RadioMethod({Key? key}) : super(key: key);

  @override
  State<RadioMethod> createState() => _RadioMethodState(standar);
}

class _RadioMethodState extends State<RadioMethod> {
   List<Standard> standar;
  _RadioMethodState(this.standar);
  // ignore: unused_field
  static bool visiblContain = false;
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Radio(value: 0, groupValue: _value, onChanged: SetPassed),
              SizedBox(
                width: 10,
              ),
              TextAnnotation(text: 'Đạt'),
              Radio(value: 1, groupValue: _value, onChanged: 
                SetPassed
              ),
              SizedBox(
                width: 10,
              ),
              TextAnnotation(text: 'Không Đạt'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            child: Container(
              alignment: Alignment.topLeft,
              child:Container(
      height: 600.0,
      width: 500.0,
      padding: EdgeInsets.only(
        right: 110, bottom: 10.0),
      // ignore: unnecessary_string_interpolations
      child: Center(
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: TextAnnotation(text: standar[Global.i].appearanceErrors.toString())),
                  SizedBox(width: 30,),
                  addCheckbox(0),
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey))
    )),
            visible: visiblContain,
          )
        ],
      ),
    );
  }

  void SetPassed(value) {
    setState(() {
      _value = int.parse(value.toString());
      visiblContain = !visiblContain;
      addCheckbox(0);
    });
  }
  Widget addCheckbox(int i){
    for(i = 0;i< standar[Global.i].appearanceErrors!.length; i++){
      return CustomCheckboxErrState();
    }
    return CustomCheckboxErrState();
  }
}

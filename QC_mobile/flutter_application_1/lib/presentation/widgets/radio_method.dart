import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:flutter_application_1/presentation/widgets/check_box.dart';
import 'package:flutter_application_1/presentation/widgets/check_passed_standar_dimension.dart';
import 'package:flutter_application_1/presentation/widgets/widget.dart';

class RadioMethod extends StatefulWidget {
  //static bool visiblecontain = false;
  //const RadioMethod({Key? key}) : super(key: key);

  @override
  State<RadioMethod> createState() => _RadioMethodState();
}

class _RadioMethodState extends State<RadioMethod> {
  // ignore: unused_field
  static bool visiblContain = false;
  late Standard standard;
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Row(
            children: [
              Radio(value: 0, groupValue: _value, onChanged: setPassed),
              SizedBox(
                width: 10,
              ),
              TextAnnotation(text: 'Đạt'),
              Radio(value: 1, groupValue: _value, onChanged: (_){
                setPassed(_value);
                addCheckbox(0);
              }),
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
              child: Contain(standard)),
            visible: visiblContain,
          )
        ],
      ),
    );
  }

  void setPassed(vallue) {
    setState(() {
      _value = int.parse(vallue.toString());
      visiblContain = !visiblContain;
    });
  }
  Object addCheckbox(int i){
    for(i = 0;i< standard.appearanceErrors!.length; i++){
      return CustomCheckboxErrState();
    }
    return Exception('');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/qa_model.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/repositories/fetch_qa_data.dart';
import 'package:flutter_application_1/domain/use_cases/get_data_qa_usecase.dart';
import 'package:flutter_application_1/presentation/state/quality_check_state.dart';
import 'package:flutter_application_1/presentation/view/global.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:textfield_search/textfield_search.dart';

class TextfieldSeach extends StatefulWidget {
   List<Standard> standar;
   TextfieldSeach(this.standar);
 // const TextfieldSeach({Key? key}) : super(key: key);
  // ignore: use_key_in_widget_constructors
  @override
  // ignore: no_logic_in_create_state
  _TextfieldSeachState createState() => _TextfieldSeachState(standar);
}
class _TextfieldSeachState extends State<TextfieldSeach> {
  List<Standard> _standar;
  TextEditingController myController = TextEditingController();
  _TextfieldSeachState(this._standar);
  
  String label = "ProducId";
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    // ignore: avoid_print
    print("Textfield value: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 50.0,
        width: 250.0,
        alignment:Alignment.center,
        child: TextFieldSearch(
          textStyle: TextStyle(fontSize: 20,),
            label: label,
            initialList: List<String>.generate( _standar.length, (index) => _standar[index].id.toString()),
            controller: myController,
            decoration: InputDecoration(
               // textAlign: TextAlign.center,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black) )
                    ),
                future: (){
                  Global.Id = myController.text;
                  for(int i = 0; i< _standar.length; i++){
                    if(myController.text == _standar[i].product!.id.toString()){
                      Global.i = i;
                    }
                  }
                },
                  ),
      ),
    );
  }
}

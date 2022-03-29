import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:flutter_application_1/presentation/widgets/check_box.dart';
import 'constant.dart';

class AnnotationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [Column()],
      ),
    );
  }
}

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Constants.mainColor),
                strokeWidth: 6.0,
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            "Đang tải dữ liệu",
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

// Text quanlityCheckProduct
class TextAnnotation extends StatelessWidget {
  final String text;
  TextAnnotation({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25.0),
    );
  }
}
class TopicText extends StatelessWidget {
  final String text;
  TopicText({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 50,
      padding: EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// container

class ContainerText extends StatelessWidget {
  final String text;
  // constructor
  const ContainerText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 250.0,
      padding: EdgeInsets.only(
        right: 110, bottom: 10.0),
      // ignore: unnecessary_string_interpolations
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey))
    );
  }
}
// Dimensionname
class ContainerTextDimenion extends StatelessWidget {
  final String text;
  // constructor
  const ContainerTextDimenion(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 200.0,
      padding: EdgeInsets.only(
        right: 110, bottom: 10.0),
      // ignore: unnecessary_string_interpolations
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey))
    );
  }
}
// DimenionResult 1
class InputTextField extends StatelessWidget {
  bool checkPassed = false;
  List<QcReport> _qcReport;
  Dimension _dimension;
  int _time;
  InputTextField(this._time,this._qcReport,this._dimension,);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        Container(
            height: 70.0,
            width: 250.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged:(_){
                
                if(_dimension.lowerBound! < double.parse(controller.text) && double.parse(controller.text) < _dimension.upperBound!){
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![0].result[_time] = double.tryParse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
                   width: 5,
                  ),
            GestureDetector(
        child: Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color:  checkPassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            border:  checkPassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ))
      ],
    );
  }
}

// dimensionresultadd
class InputDimensionTextFiled extends StatelessWidget {
final  Dimension _inputDimension;
final List<QcReport> _qcReport;
final int _time;
   InputDimensionTextFiled(this._time,this._qcReport,this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 330,
                  child: InputTextField(_time,_qcReport,_inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}
// Dimensionresult 2
class InputTextField2 extends StatelessWidget {
  bool checkPassed = false;
  List<QcReport> _qcReport;
  Dimension _dimension;
  int _time;
  InputTextField2(this._time,this._qcReport,this._dimension,);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        Container(
            height: 70.0,
            width: 250.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged:(_){
                
                if(_dimension.lowerBound! < double.parse(controller.text) && double.parse(controller.text) < _dimension.upperBound!){
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![1].result[_time] = double.tryParse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
                   width: 5,
                  ),
            GestureDetector(
        child: Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color:  checkPassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            border:  checkPassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ))
      ],
    );
  }
}

//dimensionresultadd
class InputDimensionTextFiled2 extends StatelessWidget {
final  Dimension _inputDimension;
final List<QcReport> _qcReport;
final int _time1;
   InputDimensionTextFiled2(this._time1,this._qcReport,this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 330,
                  child: InputTextField2(_time1,_qcReport,_inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}
// Dimensionresult 3
class InputTextField3 extends StatelessWidget {
  bool checkPassed = false;
  List<QcReport> _qcReport;
  Dimension _dimension;
  int _time;
  InputTextField3(this._time,this._qcReport,this._dimension,);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        Container(
            height: 70.0,
            width: 250.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged:(_){
                
                if(_dimension.lowerBound! < double.parse(controller.text) && double.parse(controller.text) < _dimension.upperBound!){
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![2].result[_time] = double.tryParse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
                   width: 5,
                  ),
            GestureDetector(
        child: Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color:  checkPassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            border:  checkPassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ))
      ],
    );
  }
}
//dimensionresultadd
class InputDimensionTextFiled3 extends StatelessWidget {
final  Dimension _inputDimension;
final List<QcReport> _qcReport;
final int _time2;
   InputDimensionTextFiled3(this._time2,this._qcReport,this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 330,
                  child: InputTextField3(_time2,_qcReport,_inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}
// Dimensionresult 4
class InputTextField4 extends StatelessWidget {
  bool checkPassed = false;
  List<QcReport> _qcReport;
  Dimension _dimension;
  int _time;
  InputTextField4(this._time,this._qcReport,this._dimension,);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        Container(
            height: 70.0,
            width: 250.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged:(_){
                
                if(_dimension.lowerBound! < double.parse(controller.text) && double.parse(controller.text) < _dimension.upperBound!){
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![3].result[_time] = double.tryParse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
                   width: 5,
                  ),
            GestureDetector(
        child: Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color:  checkPassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            border:  checkPassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ))
      ],
    );
  }
}
//dimensionresultadd
class InputDimensionTextFiled4 extends StatelessWidget {
final  Dimension _inputDimension;
final List<QcReport> _qcReport;
final int _time3;
   InputDimensionTextFiled4(this._time3,this._qcReport,this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 330,
                  child: InputTextField4(_time3,_qcReport,_inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}
// Dimensionresult 5
class InputTextField5 extends StatelessWidget {
  bool checkPassed = false;
  List<QcReport> _qcReport;
  Dimension _dimension;
  int _time;
  InputTextField5(this._time,this._qcReport,this._dimension,);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Row(
      children: [
        Container(
            height: 70.0,
            width: 250.0,
            // padding:
            // EdgeInsets.only(top: 7.0, bottom: 7.0, left: 10.0, right: 60.0),
            child: TextField(
              controller: controller,
              onChanged:(_){
                
                if(_dimension.lowerBound! < double.parse(controller.text) && double.parse(controller.text) < _dimension.upperBound!){
                  checkPassed = !checkPassed;
                  _qcReport[0].dimensionResults![3].result[_time] = double.tryParse(controller.text);
                }
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            )),
            SizedBox(
                   width: 5,
                  ),
            GestureDetector(
        child: Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Container(
        //padding: EdgeInsets.only(left: 5.0),
        decoration: BoxDecoration(
            color:  checkPassed ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(35.0),
            border:  checkPassed
                ? Border.all(color: Colors.black, width: 2.0)
                : Border.all(color: Colors.black, width: 2.0)),
        width: 25,
        height: 25,
      ),
    ))
      ],
    );
  }
}
//dimensionresultadd
class InputDimensionTextFiled5 extends StatelessWidget {
final  Dimension _inputDimension;
final List<QcReport> _qcReport;
final int _time4;
   InputDimensionTextFiled5(this._time4,this._qcReport,this._inputDimension);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 600,
          padding: EdgeInsets.only(left: 195),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(children: [
              // ignore: sized_box_for_whitespace
              Container(
                  height: 50,
                  width: 330,
                  child: InputTextField5(_time4,_qcReport,_inputDimension)),
            ]),
            //  customCheckboxState(false),
          ),
        ),
      ],
    );
  }
}
// inputnumberproduct
class InputTextFieldNumberProduct extends StatelessWidget {
  int numberProduct;
  InputTextFieldNumberProduct(this.numberProduct);
  @override
  Widget build(BuildContext context) {
    TextEditingController controllernNumberProduct = TextEditingController();
    return Container(
      height: 50.0,
      width: 250.0,
       child: TextField(
              controller: controllernNumberProduct,
              onChanged:(_){
                  numberProduct = int.parse(controllernNumberProduct.text);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black), gapPadding: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0))),
                  textAlign: TextAlign.center,
            ));
  }
}

// container appreancerror and Container appearancestandar

class Contain extends StatelessWidget {
  Standard standard;
  Contain(this.standard);
 // const Contain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      width: 500.0,
      padding: EdgeInsets.only(
        right: 110, bottom: 10.0),
      // ignore: unnecessary_string_interpolations
      child: Center(
        child: Row(
          children: [
            Container(
              width: 200,
              height: 50,
              child: TextAnnotation(text: standard.appearanceErrors.toString())),
              SizedBox(width: 30,),
          ],
        ),
      ),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey))
    );
  }
 
}


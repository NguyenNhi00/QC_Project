import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/constant.dart';
import 'package:flutter_application_1/presentation/widgets/main_name_widget.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'WELCOME!',
            style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Constants.mainColor,
      ),
      body: Column(children: [
        MainAppName(),
        SizedBox(
          height:70.0,
        ),
        Container(
          width: 300,
            height: 170,
            padding: EdgeInsets.only(bottom: 100,left: 30, right: 30),
          child: SizedBox(
            width: 200,
            height: 80,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/second');
              }, 
              child: const Text('ĐĂNG NHẬP',style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff001D37),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
              ),
          ),
        )
      ],),
    );
  }
}

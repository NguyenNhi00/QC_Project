import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/data/model/qa_model.dart';
import 'package:http/http.dart' as http;

 class FetchQaDataService {
  //  Errorpacket errorpacket;
  //  FetchQaDataService(this.errorpacket);
 // Future<List<StandardModel>> getQAdata() async {}
 // truyen token lay ve dc vao va lay cac tieu chuan
 Future<List<StandardModel>> getQAdata() async {
   final res = await http.get(
     Uri.parse("https://cha-qa-qc-test.azurewebsites.net/api/standards"),
     headers: <String,String>{ "Access-Control-Allow-Origin": "*", 
      "Access-Control-Allow-Credentials":
          'true', 
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"}
     );
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);
      List<StandardModel> standar = body
              .map((dynamic item) => StandardModel.fromJson(item))
              .toList();
      print(standar);
      return standar;
    }
    else{
      throw "Failed to load Data";
    }
 }
}


// khong dung trong chuong trinh
// ignore: must_be_immutable
class Errorpacket extends Equatable{
  String errorCode;
  String message;
  String detail;

  Errorpacket({required this.errorCode, required this.message,required this.detail});
  @override
  List<Object> get props => [errorCode, message,detail];
  
  factory Errorpacket.fromJson(dynamic jsonObject){
    return Errorpacket(
      errorCode: jsonObject['errorCode'],
      message: jsonObject['message'],
      detail: jsonObject['detail'],
    );
  }

}

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/data/model/qa_model.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/presentation/view/global.dart';
import 'package:http/http.dart' as http;

 class FetchQaDataService {
  //  Errorpacket errorpacket;
  //  FetchQaDataService(this.errorpacket);
 // Future<List<StandardModel>> getQAdata() async {}
 // truyen token lay ve dc vao va lay cac tieu chuan
 Future<List<StandardModel>> getQAdata() async {
   List<StandardModel> listStandar = [];
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
              for(int j = 0 ; j< standar.length; j++)
              {
              final response = await http.get(Uri.parse('https://cha-qa-qc-test.azurewebsites.net/api/standards/${standar[j].id}'),
              headers: <String, String>{"Access-Control-Allow-Origin": "*", 
                  "Access-Control-Allow-Credentials":
                      'true', 
                  "Access-Control-Allow-Headers":
                      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
                  "Access-Control-Allow-Methods": "POST, OPTIONS"}
              );
              if(response.statusCode == 200){
                final bodyy = jsonDecode(response.body);
                  StandardModel standarId = StandardModel.fromJson(bodyy);
                   listStandar.add(standarId);      
                  print(standarId);
                }
                else{
                  throw "Failed to load Data";
                }
              }
    return listStandar;
 } else{
      throw "Failed to load Data";
    }
 }
 }

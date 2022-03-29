import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/user_model.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/utils/username_preferences.dart';
import 'package:http/http.dart' as http;

class FetchTokenService{
//  static TextEditingController usenameCotroller = TextEditingController();
//  static TextEditingController passwordController = TextEditingController();
//  Future<UserModel> getToken() async{   }
// post username and password -> token (request and Ressponse 1 token)
  Future<UserModel> getToken( String username, String password) async {
    final url = 
          Uri.parse("https://sampleapiproject.azurewebsites.net/api/auth");
    final res = await http.post(url,
          headers: <String , String>{
          'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String , String>{
            "username": username  ,
            "password": password,
          }
          ),
        );
    if(res.statusCode == 200){
      print('success,');
      return UserModel.fromJson(jsonDecode(res.body));
    }else{
      print('false');
      throw Exception('ahhjaj');
    }
  }
}
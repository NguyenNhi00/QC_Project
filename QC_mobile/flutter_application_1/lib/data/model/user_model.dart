import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/domain/entities/user.dart';

class UserModel extends User{
  UserModel({Token? token, Employee? employee}) : super(token, employee);

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      token: json["//"] as Token, 
      employee: json["//"] as Employee
    );
  }
}

class TokenModel extends Token{
  TokenModel({String? id, String? authToken, int? expiredIn}) : super(id, authToken, expiredIn);
  factory TokenModel.fromJson(Map<String,dynamic> json){
    return TokenModel(
      id: json["//"] as String, 
      authToken: json["//"] as String, 
      expiredIn: json["//"] as int,
    );
  }

}
class EmployeeModel extends Employee{
  EmployeeModel({String? employeeId, String? firstname, String? lastname}) : super(employeeId, firstname, lastname);
  
  factory EmployeeModel.fromJson(Map<String,dynamic> json){
    return EmployeeModel(
      employeeId: json["//"] as String,
      firstname: json["//"] as String,
      lastname: json["//"] as String,
    );
  } 
}

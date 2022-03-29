import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:http/http.dart' as http;

class PostReportService{
  Future<http.Response> postReport(
    // String productId,
    // String productName,
    // String standarId,
    // DateTime productDate,
    // DateTime timeStamp,
    // int batchQuanlity,
    // List<Dimension> dimension,
    // List<DimensionResult> dimensionResults,
    // List<AppearanceError> appearanceError,
    // QcTester qcTester,
    // String fileLink,
    // bool checkpass
    QcReport qcReport,
    
  ) {
    //post 
    final url  = Uri.parse("https://cha-qa-qc-test.azurewebsites.net/api/qcreports");
     return http.post(url,
          headers:  <String, String>{
            "Content-Type":"application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{
            "Ngày Kiểm": qcReport.productionDate.toString(),
            "Thời Gian Kiểm": qcReport.timestamp.toString(),
            "Số Lượng Kiểm": qcReport.batchQuantity.toString(),
            "Kích Thước Đo Được": qcReport.dimensionResults.toString(),
            "Lỗi Ngoại Quan": qcReport.appearanceErrors.toString(),
            "QCtester": qcReport.tester.toString(),
            "Standar":qcReport.standard.toString(), 
          }
          ),
    );
    // if(res.statusCode == 500 && res.statusCode != 200 && res.statusCode != 400){
    //   final errJson = jsonDecode(res.body);
    //   return Errorpacket(detail: 'Vui lòng kiểm tra lại server', message: 'lỗi Server', errorCode: "");
    // } else{
    //   throw Exception("Failed to load Data");
    // }
  }
}


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
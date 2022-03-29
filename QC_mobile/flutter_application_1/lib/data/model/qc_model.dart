import 'package:flutter_application_1/data/model/qa_model.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';

class QcTesterModel extends QcTester{
const  QcTesterModel({String? id, String? firstname, String? lastname}) : super(id, firstname, lastname);

factory QcTesterModel.toJson(Map<String,dynamic> json) {
  return QcTesterModel(
    id: json["id"] as String, 
    firstname: json["firstName"] as String, 
    lastname: json["lastName"] as String
  );
}
}
class DimensioResultnModel extends DimensionResult{
 const DimensioResultnModel({String? name, int? time,List<double?>? result, bool? passed}) : super(name, time, result as List<double>, passed);

  factory DimensioResultnModel.toJson(Map<String,dynamic> json) {
    return DimensioResultnModel(
      name: json["name"] as String, 
      time: json["count"] as int, 
      result: json["result"] as List<double>, 
      passed:json["passed"] as bool
    );
  }
}
class AppearanceErrorModel extends AppearanceError{
  AppearanceErrorModel({String? name}) : super(name);

  factory AppearanceErrorModel.toJson(Map<String,dynamic> json){
    return AppearanceErrorModel(
      name: json["name"] as String,
      );
  }
}
class QcReportModel extends QcReport{
 const QcReportModel({
   QcTester? tester, 
   Standard? standard, 
   DateTime? productionDate, 
   DateTime? timestamp, 
   List<DimensionResult>? dimensionResults, 
   List<AppearanceError>? appearanceErrors, 
   int? batchQuantity
   }) 
        : super(
          tester, 
          standard, 
          productionDate, 
          timestamp, 
          dimensionResults, 
          appearanceErrors, 
          batchQuantity,
        );

    factory QcReportModel.toJson(Map<String, dynamic> json) {
      return QcReportModel(
        tester: json["qcTester"] as QcTester, 
        standard: json["standard"] as Standard, 
        productionDate: json["productionDate"] as DateTime, 
        timestamp: json["timestamp"] as DateTime, 
        dimensionResults: json["dimensionResults"] == null
                              ? []
                              : (json["dimensionResults"] as List )
                              .map((e) => DimensioResultnModel.toJson(e))
                              .toList(), 
        appearanceErrors: json["appearanceErrors"]== null
                            ? []
                            :(json["appearanceErrors"] as List)
                            .map((e) => AppearanceErrorModel.toJson(e))
                            .toList(), 
        batchQuantity: json["batchQuantity"] as int
        );
    }

}
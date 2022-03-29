import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';

class QcTester extends Equatable {
  final String? id;
  final String? firstname;
  final String? lastname;
  const QcTester(this.id, this.firstname, this.lastname);
  @override
  List<Object?> get props => [id, firstname, lastname];
}

class DimensionResult extends Equatable {
  final String? name;
  final int? time;
  final List<double?> result;
  final bool? passed;
  const DimensionResult(this.name, this.time, this.result, this.passed);
  @override
  List<Object?> get props => [name, time, result, passed];
}

class QcReport extends Equatable {
  final QcTester? tester;
  final Standard? standard;
  final DateTime? productionDate;
  final DateTime? timestamp;
  final List<DimensionResult>? dimensionResults;
  final List<AppearanceError>? appearanceErrors;
  final int? batchQuantity;
  const QcReport(
      this.tester,
      this.standard,
      this.productionDate,
      this.timestamp,
      this.dimensionResults,
      this.appearanceErrors,
      this.batchQuantity);
  @override
  List<Object?> get props => [
        tester,
        standard,
        productionDate,
        timestamp,
        dimensionResults,
        appearanceErrors,
        batchQuantity
      ];
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/use_cases/get_data_qa_usecase.dart';
import 'package:flutter_application_1/domain/use_cases/post_report_usecase.dart';
import 'package:flutter_application_1/presentation/event/report_event.dart';
import 'package:flutter_application_1/presentation/state/login_state.dart';
import 'package:flutter_application_1/presentation/state/report_state.dart';
import 'package:flutter_application_1/presentation/view/global.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final SendReportUsecase _sendReportUsecase;
  final GetDataQAUsecase _getDataQAUsecase;
  ReportBloc(this._sendReportUsecase, this._getDataQAUsecase) : super(IntState()) {
    on<GetStandarEvent>(onGetStandar);
    on((ReportToggleAddEvent event, emit) => emit(ReportToggleAddState(event.count)));
    on((ReportToggleAddEvent1 event, emit) => emit(ReportToggleAddState1(event.count1)));
    on((ReportToggleAddEvent2 event, emit) => emit(ReportToggleAddState2(event.count2)));
    on((ReportToggleAddEvent3 event, emit) => emit(ReportToggleAddState3(event.count3)));
    on((ReportToggleAddEvent4 event, emit) => emit(ReportToggleAddState4(event.count4)));
    on<ReportCheckingDataEvent>(onChecking);
  }

  Future<void> onGetStandar(ReportEvent event, Emitter<ReportState> emit) async{
    if(event is GetStandarEvent){
      final standar = await _getDataQAUsecase.getQAdata();
      return emit(GetStandarState(standar));
    }
  }

 

  Future<void> onChecking(ReportEvent event, Emitter<ReportState> emit) async {
    if (event is ReportCheckingDataEvent) {
       emit(ReportCheckingState(event.qcReport, event.full));
       try {
         final res = await _sendReportUsecase.sendReport(event.qcReport[0]);
         return emit(ReportDoneState());
       }catch(e){
         print(e);
       }
      String? testerId = event.qcReport[].tester!.id;
      String? testerFirstName = event.qcReport[].tester!.firstname;
      String? testerLastName = event.qcReport[].tester!.lastname;
      String? productId = event.qcReport[].standard!.product!.id;
      String? productName = event.qcReport[].standard!.product!.name;
      String? standarId = event.qcReport[].standard!.id;
      String? fileLink = event.qcReport[].standard!.fileLink;
      List<Dimension>? standardimension = event.qcReport[0].standard!.dimensions;
      List<AppearanceError>? appearanceErr = event.qcReport[0].appearanceErrors;
      DateTime? checkDate = event.qcReport[].productionDate;
      DateTime? checkTime = event.qcReport[].timestamp;
      int? batchQuanlity = event.qcReport[].batchQuantity;
      List<DimensionResult>? dimensionResult = event.qcReport[0].dimensionResults;
      if (testerId != null &&
          testerFirstName != null &&
          testerLastName != null &&
          productId != null &&
          productName != null &&
          standarId != null &&
          fileLink != null &&
          standardimension != null &&
          appearanceErr != null &&
          checkDate != null &&
          checkTime != null &&
          batchQuanlity != null &&
          dimensionResult != null) {
       
      } else {
        emit(ReportCheckingState(event.qcReport,false));
      }
    }
  }
  }
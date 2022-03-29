import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';

class ReportEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class ReportToggleAddEvent extends ReportEvent{
  final int count;
  ReportToggleAddEvent(this.count);
  @override
  List<Object> get props =>[count];
}
class ReportToggleAddEvent1 extends ReportEvent{
  final int count1;
  ReportToggleAddEvent1(this.count1);
  @override
  List<Object> get props =>[count1];
}
class ReportToggleAddEvent2 extends ReportEvent{
  final int count2;
  ReportToggleAddEvent2(this.count2);
  @override
  List<Object> get props =>[count2];
}
class ReportToggleAddEvent3 extends ReportEvent{
  final int count3;
  ReportToggleAddEvent3(this.count3);
  @override
  List<Object> get props =>[count3];
}
class ReportToggleAddEvent4 extends ReportEvent{
  final int count4;
  ReportToggleAddEvent4(this.count4);
  @override
  List<Object> get props =>[count4];
}
class ReporttoggleEvent extends ReportEvent{
  final QcReport qcReport;

  ReporttoggleEvent(this.qcReport);
  @override
  List<Object?> get props => [qcReport];
}
// getStandarEvent
 class GetStandarEvent extends ReportEvent{
   @override
   List<Object> get props => [];
 }
// nút nhấn "xác nhận lần 1"
class ReportCheckingDataEvent extends ReportEvent {
  bool full;
  List<QcReport> qcReport;
  ReportCheckingDataEvent(this.full,this.qcReport);
   @override
  List<Object?> get props => [qcReport];
}
// nút nhấn "xác nhận" lần 2
class SendReportEvent extends Equatable {
  final QcReport qcReport;
  SendReportEvent(this.qcReport);
  @override
  // TODO: implement props
  List<Object?> get props => [qcReport];
}

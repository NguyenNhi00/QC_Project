import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';

class ReportState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class IntState extends ReportState{
   @override
  // TODO: implement props
  List<Object?> get props => [];
}
// gettandar
class GetStandarState extends ReportState{
  List<Standard> standar;
  GetStandarState(this.standar);
  @override
  List<Object> get props => [standar];
}
// tao mot inputtextfield khi nhan iconbutton_add tieu chuan 1
class ReportToggleAddState extends ReportState{
  int count;
  ReportToggleAddState(this.count,);
  @override
  List<Object> get props => [count,];
}
// tao mot inputtextfield khi nhan iconbutton_add tieu chuan 2
class ReportToggleAddState1 extends ReportState{
  int count1;
  ReportToggleAddState1(this.count1,);
  @override
  List<Object> get props => [count1,];
}
// tao mot inputtextfield khi nhan iconbutton_add tieu chuan 3
// ignore: must_be_immutable
class ReportToggleAddState2 extends ReportState{
  int count2;
  ReportToggleAddState2(this.count2,);
  @override
  List<Object> get props => [count2,];
}
// tao mot inputtextfield khi nhan iconbutton_add tieu chuan 3
// ignore: must_be_immutable
class ReportToggleAddState3 extends ReportState{
  int count3;
  ReportToggleAddState3(this.count3,);
  @override
  List<Object> get props => [count3,];
}
// tao mot inputtextfield khi nhan iconbutton_add tieu chuan 4
// ignore: must_be_immutable
class ReportToggleAddState4 extends ReportState{
  int count4;
  ReportToggleAddState4(this.count4,);
  @override
  List<Object> get props => [count4,];
}
// kiểm tra info of the report
// ignore: must_be_immutable
class ReportCheckingState extends ReportState {
  List<QcReport> qcReport;
  bool fullInfo;
  ReportCheckingState(this.qcReport,this.fullInfo);
   @override
  // TODO: implement props
  List<Object?> get props => [fullInfo];
}
// màn hình xác nhận report thành công
class ReportDoneState extends ReportState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/presentation/event/quality_check_event.dart';

class QualityCheckBloc extends Bloc<QualityCheckEvent, QualityCheckEvent>{
  QualityCheckBloc(QualityCheckEvent initialState) : super(initialState);
  
}
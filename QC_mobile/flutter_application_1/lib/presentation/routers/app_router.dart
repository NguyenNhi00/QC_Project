



import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/injector.dart';
import 'package:flutter_application_1/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/report_bloc.dart';
import 'package:flutter_application_1/presentation/event/report_event.dart';
import 'package:flutter_application_1/presentation/view/home_screen.dart';
import 'package:flutter_application_1/presentation/view/login_view.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:flutter_application_1/presentation/view/report_success_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';


class AppRouter {
  // ignore: non_constant_identifier_names
  static Route OnGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) => BlocProvider<LoginBloc>(
                  create: (context) => injector(),
                  child: LoginScreen(),
                ));
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ReportBloc>(
                  create: (context) => injector()..add(GetStandarEvent()),
                  child: QuanlityScreen(),
                )
          );
          break;
      case '/four': return MaterialPageRoute(builder: (context)=>ReportDoneScreen());
      break;
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}

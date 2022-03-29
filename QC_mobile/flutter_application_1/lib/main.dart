import 'package:flutter/material.dart';
import 'package:flutter_application_1/injector.dart';
import 'package:flutter_application_1/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/presentation/routers/app_router.dart';
import 'package:flutter_application_1/presentation/view/home_screen.dart';
import 'package:flutter_application_1/presentation/view/login_view.dart';
import 'package:flutter_application_1/presentation/view/quanlityscreen.dart';
import 'package:flutter_application_1/presentation/view/report_success_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async{
  await initialzeDependencies();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    //final AppRouter _appRouter = AppRouter();
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Kiểm định chất lượng và Báo cáo',
      onGenerateRoute: AppRouter.OnGenerateRoutes,
      //initialRoute: '/',

      // routes: {
      //   '/' : (context) =>  Home(),
      //   '/second': (context) =>  MaterialApp(
      //     home: Scaffold(body: BlocProvider<LoginBloc>(create: (context)=> injector(),
      //     child: LoginScreen(),),
      //     ),
      //   ),
      //   '/third' : (context) => QuanlityScreen(),
      //   '/four' : (context) => ReportDoneScreen(),
      // },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/presentation/bloc/report_bloc.dart';
import 'package:flutter_application_1/presentation/event/report_event.dart';
import 'package:ndialog/ndialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingDialog {
  BuildContext buildContext;
  LoadingDialog(this.buildContext);
  ProgressDialog? progressDialog;
  void show() {
    progressDialog = ProgressDialog(
      buildContext,
      title: null,
      message: Text(
        "Đang tải",
        style: TextStyle(fontSize: 20),
      ),
      dismissable: true,
      defaultLoadingWidget: Container(
          //Do dialog ko có kích thước, nên dùng chính Container để chỉnh kích thước cho Dialog và padding để ép size Circular
          padding: EdgeInsets.all(15),
        //  width: 60,
          height: 60,
          child: CircularProgressIndicator(
            strokeWidth: 3,
          )),
    );
    progressDialog!.show();
  }

  void dismiss() {
    progressDialog!.dismiss();
  }
}

class ConfirmDiaog{
  List<QcReport> qcReport;
  BuildContext buildContext;
  ConfirmDiaog(this.qcReport, this.buildContext);
 void showMyAlertDialog(BuildContext context) {
    bool tappedCancel = false;
    // creater a AlertDialog
    AlertDialog dialog = AlertDialog(
      title: Text('Khung Xác Nhận'),
      content: Text('Bạn Có Chắc Chắn Muốn Xác Nhận'),
      actions: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<ReportBloc>(context).add(ReportCheckingDataEvent(true,qcReport
            ));
            Navigator.pushNamed(context, '/four');
          },
          child: Text(
            'XÁC NHẬN',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xff001D37)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(
            'HỦY BỎ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xff001D37)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
          ),
        ),
      ],
    );
    Future futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
    futureValue.then((value) {
      print("Return value: " + value.toString()); // true/false
    });
  }
}

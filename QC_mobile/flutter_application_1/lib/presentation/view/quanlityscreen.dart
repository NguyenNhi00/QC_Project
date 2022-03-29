// ignore_for_file: unnecessary_brace_in_string_interps


import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/qa_data.dart';
import 'package:flutter_application_1/domain/entities/qc_data.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/presentation/bloc/report_bloc.dart';
import 'package:flutter_application_1/presentation/event/report_event.dart';
import 'package:flutter_application_1/presentation/state/report_state.dart';
import 'package:flutter_application_1/presentation/view/global.dart';
import 'package:flutter_application_1/presentation/widgets/constant.dart';
import 'package:flutter_application_1/presentation/widgets/radio_method.dart';
import 'package:flutter_application_1/presentation/widgets/text_field_seach.dart';
import 'package:flutter_application_1/presentation/widgets/viewpdf.dart';
import 'package:flutter_application_1/presentation/widgets/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class QuanlityScreen extends StatefulWidget {

  // ignore: use_key_in_widget_constructors

  @override
  State<QuanlityScreen> createState() => _QuanlityScreenState();
}

class _QuanlityScreenState extends State<QuanlityScreen> {
  static int _count = 0;
  static int _count1 = 0;
  static int _count2 = 0;
  static int _count3 = 0;
  static int _count4 = 0;
  static int _time = 0;
  static int _time1 = 0;
  static int _time2 = 0;
  static int _time3 = 0;
  static int _time4 = 0;
   String checkingTime = '';
   String checkingDate = '';
  bool visible = false;
  List<Standard> _standard = [];
  List<QcReport> _qcReport = [];
  //final double dimension1 = 0;
 

  @override
  Widget build(BuildContext context) {
    // final arg =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // final employeeIdoverrall = arg['Id'];
    // final employeeFirstnameoverrall = arg['Firstname'];
    // final employeeLastnameoverrall = arg['Lastname'];

    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'KIỂM TRA CHẤT LƯỢNG SẢN PHẨM',
            style: TextStyle(fontSize: 30.0),
          )),
          backgroundColor: Constants.mainColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            tooltip: 'nut tro ve',
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Constants.thirdColor,
          child: Column(
            children: [
              Container(
                width: 310,
                height: 200,
                decoration: BoxDecoration(color: Constants.mainColor),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 200.0,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 310,
                height: 100,
                //margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Constants.mainColor),
                child: Center(
                  child: Text(
                    'Người Kiểm Tra: ', //// lấy dữ liệu lưu vào đây
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
                thickness: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 60.0, top: 60),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Cài Đặt',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 60.0, top: 40.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Đăng Xuất',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //     scrollDirection: Axis.vertical,
        //     child: BlocConsumer<ReportBloc, ReportState>(
        //         listener: (context, qualityState) async {},
        //         builder: (context, qualityState) {
        //           return Column(children: [
        //                 ListView(
        //                   shrinkWrap: true,
        //                   padding: EdgeInsets.only(left: 100, right: 100),
        //                   children: [
        //                     SizedBox(height: 70),
        //                     // SizedBox(height:SizeConfig.screenheight * 0.0584,),
        //                     Column(
        //                       children: [
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(
        //                                 text: 'Mã Sản Phẩm:',
        //                               ),
        //                             ),
        //                             Textfield_seach(),
        //                             SizedBox(
        //                               // width: SizeConfig.screenWidth * 0.05242,
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Ngày Kiểm:')),
        //                             ContainerText(
        //                                 productDate) // lay du lieu ngày thang gan vào bien text của container,
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Tên Sản Phẩm')),
        //                             ContainerText(productName),
        //                             SizedBox(
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Thời Gian Kiểm')),
        //                             ContainerText(productTime)
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Mã Tiêu Chuẩn')),
        //                             ContainerText(standarId),
        //                             SizedBox(
        //                               width: 100,
        //                             ),
        //                             Container(
        //                               height: 50.0,
        //                               width: 250.0,
        //                               padding: EdgeInsets.only(left: 10),
        //                               child: TextAnnotation(text: 'Số Lượng Kiểm')),
        //                               InputTextField(),
        //                           ],
        //                         )
        //                       ],
        //                     )
        //                   ],
        //                 ),

        //           ]);
        //         })
        //         )
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: BlocConsumer<ReportBloc, ReportState>(
                listener: (context, reportState) {
              if(reportState is IntState){
                todayDate(){
                  var now = DateTime.now();
                  var checking  = DateFormat('dd-MM-yyyy');
                  checkingTime = DateFormat('kk:mm:a').format(now);
                  checkingDate = checking.format(now);
                }
              }
              else if(reportState is GetStandarState){
                 _standard = reportState.standar;
              }
              else if (reportState is ReportToggleAddState) {
                _count++;
                _time = _qcReport[0].dimensionResults![0].time! + 1;
              } else if (reportState is ReportToggleAddState1) {
                _count1++;
                 _time1 = _qcReport[0].dimensionResults![1].time! + 1;
              } else if (reportState is ReportToggleAddState2) {
                _count2++;
                 _time2 = _qcReport[0].dimensionResults![2].time! + 1;
              } else if (reportState is ReportToggleAddState3) {
                _count3++;
                _time3 = _qcReport[0].dimensionResults![3].time! + 1;
              } else if (reportState is ReportToggleAddState4) {
                _count4++;
                 _time4 = _qcReport[0].dimensionResults![4].time! + 1;
              }else if(reportState is ReportCheckingState){
                _qcReport = reportState.qcReport;
              }
            }, builder: (context, reportState) {
              if(reportState is GetStandarState){
              return Column(children: [
                Row(children: [
                  Container(
                      width: 700,
                      height: 3000,
                      //decoration: BoxDecoration(color: Colors.blue),
                      margin: EdgeInsets.only(left: 50, bottom: 170),
                      //padding: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        // scrollDirection: Axis.vertical,
                        //  shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(height: 70),
                          Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 200.0,
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: TextAnnotation(
                                  text: 'Mã Sản Phẩm:',
                                ),
                              ),
                              Container(
                                  height: 50.0,
                                  width: 250.0,
                                  padding: EdgeInsets.only(
                                      // top: 7.0,
                                      //  bottom: 7.0,
                                      right: 0.0),
                                  child: TextfieldSeach(_standard)),
                              SizedBox(
                                // width: SizeConfig.screenWidth * 0.05242,
                                width: 250,
                              ),
                              // Container(
                              //     height: 50.0,
                              //     width: 200.0,
                              //     padding: EdgeInsets.only(left: 10, top: 10),
                              //     child: TextAnnotation(text: 'Ngày Kiểm:')),
                              // ContainerText(
                              //     productDate) // lay du lieu ngày thang gan vào bien text của container,
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 200.0,
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: TextAnnotation(
                                  text: 'Tên Sản Phẩm:',
                                ),
                              ),
                              ContainerText(_standard[Global.i].product!.name.toString()),
                              SizedBox(
                                // width: SizeConfig.screenWidth * 0.05242,
                                width: 250,
                              ),
                              // Container(
                              //     height: 50.0,
                              //     width: 200.0,
                              //     padding: EdgeInsets.only(left: 10, top: 10),
                              //     child: TextAnnotation(text: 'Thời Gian Kiểm:')),
                              // ContainerText(productTime) // lay d
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50.0,
                                width: 200.0,
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: TextAnnotation(
                                  text: 'Mã Tiêu Chuẩn:',
                                ),
                              ),
                              ContainerText(_standard[Global.i].id.toString()),
                              SizedBox(
                                // width: SizeConfig.screenWidth * 0.05242,
                                width: 250,
                              ),
                              // Container(
                              //     height: 50.0,
                              //     width: 200.0,
                              //     padding: EdgeInsets.only(left: 10, top: 10),
                              //     child: TextAnnotation(text: 'Số Lượng Kiểm:')),
                              // Container(
                              //     height: 50.0,
                              //     width: 250.0,
                              //     padding: EdgeInsets.only(
                              //         // top: 7.0,
                              //         //  bottom: 7.0,
                              //         right: 0.0),
                              //     child: InputTextField()),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Row(
                            children: [
                              TopicText(text: 'KÍCH THƯỚC'),
                              SizedBox(
                                width: 125,
                              ),
                              //  TopicText(text: 'TIÊU CHUẨN NGOẠI QUAN'),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                              ),
                              TextAnnotation(
                                text: 'Chuẩn',
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              TextAnnotation(text: 'Kết Quả Đo'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextAnnotation(
                                        text: _standard[Global.i].dimensions![0].name.toString()), // lay dư lieu "name" gan vao day
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // ignore: unnecessary_string_interpolations
                                    ContainerTextDimenion('${_standard[Global.i].dimensions![0].lowerBound.toString()} - ${_standard[Global.i].dimensions![0].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 330.0,
                                      padding: EdgeInsets.only(
                                          // top: 7.0,
                                          //  bottom: 7.0,
                                          right: 0.0),
                                      child: InputTextField(_time,_qcReport,_standard[Global.i].dimensions![0]),
                                    ),
                                    //  customCheckboxState(),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ReportBloc>(context)
                                            .add(ReportToggleAddEvent(_QuanlityScreenState._count));
                                      },
                                      icon: Icon(Icons.add_circle),
                                      iconSize: 50,
                                    ),
                                  ],
                                ),

                                // add tiêu chuan 1
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled(_time,_qcReport,_standard[Global.i].dimensions![0])
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count > 0,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled(_time,_qcReport,_standard[Global.i].dimensions![0]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count > 1,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled(_time,_qcReport,_standard[Global.i].dimensions![0]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count > 2,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled(_time,_qcReport,_standard[Global.i].dimensions![0]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count > 3,
                                ),
                              ],
                            ),

                            // tieu chuan 2
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextAnnotation(
                                        text: _standard[Global.i].dimensions![1].name.toString()), // lay dư lieu "name" gan vao day
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ContainerTextDimenion(
                                        '${_standard[Global.i].dimensions![1].lowerBound.toString()} - ${_standard[Global.i].dimensions![1].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 330.0,
                                      child: InputTextField2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ),
                                    //    customCheckboxState()
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ReportBloc>(context)
                                            .add(
                                                ReportToggleAddEvent1(_QuanlityScreenState._count1));
                                      },
                                      icon: Icon(Icons.add_circle),
                                      iconSize: 50,
                                    ),
                                  ],
                                ),
                                // add them widget inputtextfield cho tieu chuan 2

                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count1 > 0,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count1 > 1,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count1 > 2,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count1 > 3,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled2(_time1,_qcReport,_standard[Global.i].dimensions![1]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count1 > 4,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            // tieu chuan 3
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        TextAnnotation(
                                            text: _standard[Global.i].dimensions![2].name.toString()), // lay dư lieu "name" gan vao day
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ContainerTextDimenion(
                                            '${_standard[Global.i].dimensions![2].lowerBound.toString()} - ${_standard[Global.i].dimensions![2].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 50.0,
                                          width: 330.0,
                                          child: InputTextField3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ),
                                        //  customCheckboxState(),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            BlocProvider.of<ReportBloc>(context)
                                                .add(ReportToggleAddEvent2(
                                                    _QuanlityScreenState._count2));
                                          },
                                          icon: Icon(Icons.add_circle),
                                          iconSize: 50,
                                        ),
                                      ],
                                    ),

                                    // add widget inputtextfield cho tieu chuan 2
                                    Visibility(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 55,
                                          ),
                                           InputDimensionTextFiled3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ],
                                      ),
                                      visible: _QuanlityScreenState._count2 > 0,
                                    ),
                                    Visibility(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 55,
                                          ),
                                           InputDimensionTextFiled3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ],
                                      ),
                                      visible: _QuanlityScreenState._count2 > 1,
                                    ),
                                    Visibility(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 55,
                                          ),
                                           InputDimensionTextFiled3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ],
                                      ),
                                      visible: _QuanlityScreenState._count2 > 2,
                                    ),
                                    Visibility(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 55,
                                          ),
                                           InputDimensionTextFiled3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ],
                                      ),
                                      visible: _QuanlityScreenState._count2 > 3,
                                    ),
                                    Visibility(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 55,
                                          ),
                                           InputDimensionTextFiled3(_time2,_qcReport,_standard[Global.i].dimensions![2]),
                                        ],
                                      ),
                                      visible: _QuanlityScreenState._count2 > 4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // tieu chuan 4
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextAnnotation(
                                        text: _standard[Global.i].dimensions![3].name.toString()), // lay dư lieu "name" gan vao day
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ContainerTextDimenion(
                                        '${_standard[Global.i].dimensions![3].lowerBound.toString()} - ${_standard[Global.i].dimensions![3].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 330.0,
                                      child: InputTextField4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ),
                                    // customCheckboxState(),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ReportBloc>(context)
                                            .add(
                                                ReportToggleAddEvent3(_QuanlityScreenState._count3));
                                      },
                                      icon: Icon(Icons.add_circle),
                                      iconSize: 50,
                                    ),
                                  ],
                                ),
                                // add widget inputtextfield cho tieu chuan 4
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count3 > 0,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count3 > 1,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count3 > 2,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count3 > 3,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled4(_time3,_qcReport,_standard[Global.i].dimensions![3]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count3 > 4,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // tieu chuan 5
                            Column(
                              children: [
                                Row(
                                  children: [
                                    TextAnnotation(
                                        text: _standard[Global.i].dimensions![4].name.toString()), // lay dư lieu "name" gan vao day
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ContainerTextDimenion(
                                        '${_standard[Global.i].dimensions![4].lowerBound.toString()} - ${_standard[Global.i].dimensions![4].upperBound.toString()}'), // lay dư lieu "productStanderDimension" gan vao day
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 330.0,
                                      child: InputTextField5(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    //  customCheckboxState(),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        BlocProvider.of<ReportBloc>(context)
                                            .add(
                                                ReportToggleAddEvent4(_QuanlityScreenState._count4));
                                      },
                                      icon: Icon(Icons.add_circle),
                                      iconSize: 50,
                                    ),
                                  ],
                                ),
                                // add widget inputtextfield
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled5(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count4 > 0,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled5(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count4 > 1,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled5(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count4 > 2,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled5(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count4 > 3,
                                ),
                                Visibility(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 55,
                                      ),
                                       InputDimensionTextFiled(_time4,_qcReport,_standard[Global.i].dimensions![4]),
                                    ],
                                  ),
                                  visible: _QuanlityScreenState._count4 > 4,
                                ),
                              ],
                            ),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              TopicText(text: 'NGOẠI QUAN'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RadioMethod(),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 170,
                            padding: EdgeInsets.only(bottom: 100, left: 450),
                            child: SizedBox(
                              width: 200,
                              height: 80,
                              child: ElevatedButton(
                                onPressed: () {
                                  showAboutDialog(context: (context));
                                },
                                child: const Text(
                                  'XÁC NHẬN',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color(0xff001D37),
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)))),
                              ),
                            ),
                          ),
                          //row2
                        ],
                      )),
                  Column(
                    //height
                    //width
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        width: 450,
                        height: 3000,
                        // decoration: BoxDecoration(color: Colors.blue),
                        margin: EdgeInsets.only(bottom: 170, right: 50),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 70,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 50.0,
                                    width: 200.0,
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: TextAnnotation(text: 'Ngày Kiểm:')),
                                ContainerText(checkingDate),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 50.0,
                                    width: 200.0,
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child: TextAnnotation(
                                        text: 'Thời Gian Kiểm:')),
                                ContainerText(checkingTime),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 50.0,
                                    width: 200.0,
                                    padding: EdgeInsets.only(left: 10, top: 10),
                                    child:
                                        TextAnnotation(text: 'Số Lượng Kiểm:')),
                                Container(
                                    height: 50.0,
                                    width: 250.0,
                                    padding: EdgeInsets.only(
                                        // top: 7.0,
                                        //  bottom: 7.0,
                                        right: 0.0),
                                    child: InputTextFieldNumberProduct(int.parse(_qcReport[Global.i].batchQuantity.toString())),
                                )],
                            ), //  lay du lieu ngày thang gan vào bien text của container,
                            SizedBox(
                              height: 70,
                            ),
                            TopicText(text: 'TIÊU CHUẨN NGOẠI QUAN'),
                            Container(
                                height: 600.0,
                                width: 500.0,
                                padding:
                                    EdgeInsets.only(right: 110, bottom: 10.0),
                                // ignore: unnecessary_string_interpolations
                                child: Center(
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 200,
                                          height: 50,
                                          child: ViewPdf('http://www.africau.edu/images/default/sample.pdf')),
                                      SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                          ],
                        ),
                      ),
                    ],
                  )
                ])
              ]);
            } else{
              return Container();
            }
            } 
            )));
  }
}

// class InputDimensionTextFiled extends StatelessWidget {
// final  Dimension _inputDimension;
// final List<QcReport> _qcReport;
//    InputDimensionTextFiled(this._qcReport,this._inputDimension);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 10,
//         ),
//         Container(
//           width: 600,
//           padding: EdgeInsets.only(left: 195),
//           // ignore: avoid_unnecessary_containers
//           child: Container(
//             child: Row(children: [
//               // ignore: sized_box_for_whitespace
//               Container(
//                   height: 50,
//                   width: 330,
//                   child: InputTextField(_qcReport,_inputDimension)),
//             ]),
//             //  customCheckboxState(false),
//           ),
//         ),
//       ],
//     );
//   }
// }
// class TextfieldSeach extends StatefulWidget {
//  // const TextfieldSeach({Key? key}) : super(key: key);
//  _QuanlityScreenState _quanlityScreenState;
//   final String tensanpham;
//   final String matieuchuan;
//   final DateTime ngaykiem;
//   final DateTime thoigiankiem;
//   final String filetieuchuan;
//   List<Dimension> dimension;
//   // ignore: use_key_in_widget_constructors
//   TextfieldSeach(
//       this._quanlityScreenState,
//       this.tensanpham, 
//       this.matieuchuan,
//       this.ngaykiem, 
//       this.thoigiankiem, 
//       this.filetieuchuan,
//       this.dimension);

//   @override
//   // ignore: no_logic_in_create_state
//   _TextfieldSeachState createState() => _TextfieldSeachState(
//     _quanlityScreenState,
//     tensanpham,matieuchuan,
//     ngaykiem,thoigiankiem,
//     filetieuchuan,
//     dimension
//   );
// }
// class _TextfieldSeachState extends State<TextfieldSeach> {
//   TextEditingController myController = TextEditingController();
//   final _QuanlityScreenState _quanlityScreenState;
//   String label = "ProducId";
//     String tensanpham;
//     String matieuchuan;
//     DateTime ngaykiem;
//     DateTime thoigiankiem;
//     String filetieuchuan;
//     List<Dimension> dimension;
//    _TextfieldSeachState(
//      this._quanlityScreenState,
//       this.tensanpham, 
//       this.matieuchuan,
//       this.ngaykiem, 
//       this.thoigiankiem, 
//       this.filetieuchuan,
//       this.dimension);
   
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the
//     // widget tree.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Start listening to changes.
//     myController.addListener(_printLatestValue);
//   }

//   _printLatestValue() {
//     // ignore: avoid_print
//     print("Textfield value: ${myController.text}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         height: 50.0,
//         width: 250.0,
//         alignment:Alignment.center,
//         child: TextFieldSearch(
//           textStyle: TextStyle(fontSize: 20,),
//             label: label,
//             initialList: _quanlityScreenState._standard[0].product!.id as List,
//             controller: myController,
//             decoration: InputDecoration(
//                // textAlign: TextAlign.center,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black)
//                     ),
//                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black) )
//                     ),
//         getSelectedValue: (){
//            for(int i = 0; i< _quanlityScreenState._standard.length; i++){
//               tensanpham = _quanlityScreenState._standard[i].product!.name.toString();
//               ngaykiem = DateTime.parse(DateFormat.yMd().toString());
//               thoigiankiem = DateTime.parse(DateFormat.jm().toString());
//               matieuchuan = _quanlityScreenState._standard[i].id.toString();
//               filetieuchuan = _quanlityScreenState._standard[i].fileLink.toString();
//               dimension = _quanlityScreenState._standard[i].dimensions!.toList();
//            }
//         },
//                   ),
//       );
    
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/report_bloc.dart';
import 'package:flutter_application_1/presentation/event/login_event.dart';
import 'package:flutter_application_1/presentation/event/report_event.dart';
import 'package:flutter_application_1/presentation/state/login_state.dart';
import 'package:flutter_application_1/presentation/view/dialog.dart';
import 'package:flutter_application_1/presentation/view/home_screen.dart';
import 'package:flutter_application_1/presentation/widgets/constant.dart';
import 'package:flutter_application_1/utils/password_preferences.dart';
import 'package:flutter_application_1/utils/username_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  bool _passwordErr = false;
  bool _userErr = false;
  bool _isShow = true;
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void initState() {
    super.initState();
    userController.text = UsernamePreferences.getUsername() ?? '';
    passController.text = PasswordPreferences.getPassword() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    LoadingDialog loadingDialog = LoadingDialog(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'ĐĂNG NHẬP',
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, loginstate) async {
              if (loginstate is LoginLoadingState) {
                loadingDialog.show();
              }
              // else if(loginstate is LoginDoneState){
              //   loadingDialog.dismiss();
              //}
              else if (loginstate is LoginStateFormatChecking) {
                _passwordErr = loginstate.isPasswordErr;
                _userErr = loginstate.isUsernameErr;
              } else if (loginstate is LoginStateToggleShow) {
                _isShow = !loginstate.isShow;
              } else if (loginstate is LoginDoneState) {
                loadingDialog.dismiss();
                await UsernamePreferences.setUsername(userController.text);
                await PasswordPreferences.setPassword(passController.text);
                String? employeeIdoverrall =
                    loginstate.user.employee?.employeeId;
                String? employeeFirstnameoverrall =
                    loginstate.user.employee?.firstname;
                String? employeeLastnameoverrall =
                    loginstate.user.employee?.lastname;
                // Navigator.popAndPushNamed(context, '/third', arguments: {
                //   'Id': employeeIdoverrall.toString(),
                //   'Firstname': employeeFirstnameoverrall.toString(),
                //   'Lastname': employeeLastnameoverrall.toString(),
                // }
                // );
              }
            },
            builder: (context, loginState) {
              return Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 100, right: 100),
                    children: <Widget>[
                      SizedBox(height: SizeConfig.screenheight * 0.0256),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: const AssetImage('lib/assets/CHAlogo.png'),
                            width: SizeConfig.screenWidth * 0.16605,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.05242,
                          ),
                          Image(
                            image:
                                const AssetImage('lib/assets/BK_VIAMLAB.png'),
                            width: SizeConfig.screenWidth * 0.15605,
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenheight * 0.05761),
                      TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          hintText: 'Tên Đăng Nhập',
                          hintStyle: TextStyle(fontSize: 18),
                          errorText: _userErr
                              ? 'Tên Đăng Nhập Phải Dài Hơn 3 Ký Tự'
                              : null,
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            gapPadding: 15,
                          ),
                        ),
                        onChanged: (_) {
                          BlocProvider.of<LoginBloc>(context).add(
                              LoginEventChecking(
                                  userController.text, passController.text));
                        },
                      ),
                      SizedBox(height: SizeConfig.screenheight * 0.05761),
                      Stack(alignment: AlignmentDirectional.topEnd, children: [
                        TextFormField(
                          obscureText: _isShow,
                          controller: passController,
                          decoration: InputDecoration(
                            hintText: 'Mật Khẩu',
                            hintStyle: TextStyle(fontSize: 18),
                            errorText: _userErr
                                ? 'Mật Khẩu Phải Dài Hơn 6 Ký Tự'
                                : null,
                            errorStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              gapPadding: 15,
                            ),
                          ),
                          onChanged: (_) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginEventChecking(
                                    userController.text, passController.text));
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(LoginEventToggleShow(_isShow));
                          },
                          icon: Icon(
                            _isShow ? Icons.visibility_off : Icons.visibility,
                            color: Constants.mainColor,
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        width: 300,
                        height: 70,
                        padding: EdgeInsets.only(left: 270, right: 270),
                        child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Constants.mainColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            onPressed: () {
                              // (userController.text == "" ||
                              //         passController.text == "" ||
                              //         _userErr ||
                              //         _passwordErr)
                              //     ? null
                              //     : () async {
                              //         BlocProvider.of<LoginBloc>(context).add(
                              //             LoginLoadingEvent(
                              //                 userController.text,
                              //                 passController.text,
                              //                 ));
                              //       };
                              Navigator.pushNamed(context, '/third');
                            },
                            child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/entities/user.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends LoginState {
  bool isshow;
  bool isUserNameError;
  bool isPasswordError;
  InitialState(this.isshow, this.isUserNameError, this.isPasswordError);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginStateToggleShow extends LoginState {
  bool isShow;
  LoginStateToggleShow(this.isShow);

  @override
  // TODO: implement props
  List<Object> get props => [isShow];
}

class LoginStateFormatChecking extends LoginState {
  bool isUsernameErr;
  bool isPasswordErr;
  LoginStateFormatChecking(this.isUsernameErr, this.isPasswordErr);

  @override
  // TODO: implement props
  List<Object> get props => [isUsernameErr, isPasswordErr];
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginDoneState extends LoginState {
  User user;
  LoginDoneState(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

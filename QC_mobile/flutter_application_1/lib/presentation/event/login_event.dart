import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEventToggleShow extends LoginEvent {
  bool isShow;
  LoginEventToggleShow(this.isShow);
  @override
  List<Object> get props => [isShow];
}
class LoginEventChecking extends LoginEvent {
  String userName;
  String passWord;
  LoginEventChecking(this.userName, this.passWord);
  @override
  List<Object> get props => [userName, passWord];
}
// request login
class LoginLoadingEvent extends LoginEvent {
  final String username;
  final String password;
  LoginLoadingEvent(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}
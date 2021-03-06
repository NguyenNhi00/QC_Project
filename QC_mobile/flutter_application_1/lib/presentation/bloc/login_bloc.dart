import 'package:flutter_application_1/domain/use_cases/get_user_usecase.dart';
import 'package:flutter_application_1/presentation/event/login_event.dart';
import 'package:flutter_application_1/presentation/state/login_state.dart';
import 'package:flutter_application_1/presentation/view/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserUsecase _getUserUsecase;
  LoginBloc(this._getUserUsecase) : super(InitialState(true, false, false)) {
    on<LoginEventToggleShow>(
        (event, emit) => emit(LoginStateToggleShow(event.isShow)));
    on<LoginEventChecking>(onChecking);
    on<LoginLoadingEvent>(onLogin);
  }
  void onChecking(LoginEvent event, Emitter<LoginState> emit) {
    if (event is LoginEventChecking) {
      bool passwordErr = event.passWord.length < 6;
      bool userErr = event.userName.length < 3;
      emit(LoginStateFormatChecking(userErr, passwordErr));
    }
  }

  Future<void> onLogin(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginLoadingEvent) {
      emit(LoginLoadingState());
      try {
        final res =
            await _getUserUsecase.getUser(event.username, event.password);
        final data_user = res;
        Global.token = res.token!.authToken.toString();
        return emit(LoginDoneState(data_user));
      } catch (e) {
        print(e);
      }
    }
  }
}

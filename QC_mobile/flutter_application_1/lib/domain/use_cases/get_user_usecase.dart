import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/repositories/authentication_repository.dart';

class GetUserUsecase {
  AuthenticationRepository authenticationRepository;
  GetUserUsecase(this.authenticationRepository);
  Future<User> getUser(String username, String password) async {
    final userdata = authenticationRepository.authenticate(username, password);
    return userdata;
  }
}

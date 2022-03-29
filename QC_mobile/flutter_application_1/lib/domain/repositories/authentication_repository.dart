import 'package:flutter_application_1/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> authenticate(
      String username, String password);
}

import 'dart:io';

import 'package:flutter_application_1/data/data_source/fetch_token.dart';
import 'package:flutter_application_1/data/model/user_model.dart';
import 'package:flutter_application_1/domain/entities/user.dart';
import 'package:flutter_application_1/domain/repositories/authentication_repository.dart';
import 'package:flutter_application_1/presentation/widgets/constant.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepoimpl implements AuthenticationRepository {
  final FetchTokenService fetchTokenService;
  AuthenticationRepoimpl(this.fetchTokenService);
  @override
  Future<User> authenticate(String username, String password) async{
    return fetchTokenService.getToken(username, password);
    }
  }


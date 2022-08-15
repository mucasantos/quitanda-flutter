import 'dart:developer';

import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future<AuthResult> validateToken(String userToken) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttptMethods.get,
        headers: {
          'X-Parse-Session-Token': userToken,
        });

    if (result['code'] == null) {
      log(result.toString());
      final user = UserModel.fromJson(result);
      return AuthResult.success(user);
    } else {
      log(result.toString());
      return AuthResult.error('Token Inválido');
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.signIn, method: HttptMethods.post, body: {
      'email': email,
      'password': password,
    });

    if (result['code'] == null) {
      log(result.toString());
      final user = UserModel.fromJson(result);
      return AuthResult.success(user);
    } else {
      log(result.toString());
      return AuthResult.error('Usuário ou senha inválida');
    }
  }
}

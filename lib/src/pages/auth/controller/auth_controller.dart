import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  AuthRepository authRepository = AuthRepository();

  Future<void> signIn({
    required String email,
    required password,
  }) async {
    isLoading.value = true;
    final loginData = await authRepository.signIn(
      email: email,
      password: password,
    );

    log(loginData.toString());
    isLoading.value = false;
  }
}

import 'dart:developer';

import 'package:get/get.dart';
import 'package:quitanda/src/models/user_model.dart';
import 'package:quitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda/src/pages/auth/result/auth_result.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/util_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();
  UserModel user = UserModel();

  UtilServices utilServices = UtilServices();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  void saveTokenAndProceedToBase() async {
    await utilServices.saveLocalData(
      key: 'token',
      data: user.sessionToken!,
    );
    Get.offAllNamed(PagesRoutes.homeScreen);
  }

  Future<void> validateToken() async {
    String? token = await utilServices.getLocalData(key: 'token');

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    log(token);
    AuthResult result = await authRepository.validateToken(token);

    result.when(success: (user) {
      this.user = user;

      saveTokenAndProceedToBase();
    }, error: (error) {
      signOut();
    });
  }

  Future<void> signOut() async {
    //zerar user

    user = UserModel();

    //remover token

    await utilServices.removeLocalData(key: 'token');

    // ir para login

    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signIn({
    required String email,
    required password,
  }) async {
    // isLoading.value = true;
    AuthResult loginData = await authRepository.signIn(
      email: email,
      password: password,
    );

    isLoading.value = true;

    loginData.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (error) {
        UtilServices.showToast(
          message: error!,
          isError: true,
        );
      },
    );

    isLoading.value = false;
  }
}

import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future signIn({required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.signIn, method: HttptMethods.post, body: {
      'email': email,
      'password': password,
    });

    return result;
  }
}

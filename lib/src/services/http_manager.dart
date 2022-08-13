import 'package:dio/dio.dart';

class HttpManager {
  Dio dio = Dio();

  Future restRequest({
    required String url,
    required String method,
    Map? headers,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'application/json',
        'X-Parse-REST-API-Key': 'application/json',
      });
    dio.request(url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ));
  }
}

abstract class HrrtMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

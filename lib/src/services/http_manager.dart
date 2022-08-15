import 'package:dio/dio.dart';
import 'package:quitanda/src/config/apidata.dart';

class HttpManager {
  Dio dio = Dio();

  Future restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': ApiData.xParseAppId,
        'X-Parse-REST-API-Key': ApiData.xParseRestId,
      });
    return await dio.request(
      url,
      options: Options(
        method: method,
        headers: defaultHeaders,
      ),
      data: body,
    );
  }
}

abstract class HttptMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

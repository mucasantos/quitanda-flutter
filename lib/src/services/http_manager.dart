import 'package:dio/dio.dart';
import 'package:quitanda/src/config/apidata.dart';

class HttpManager {
  Dio dio = Dio();

  Future<Map<String, dynamic>> restRequest({
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

    try {
      Response result = await dio.request(
        url,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
        data: body,
      );

      return result.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}

abstract class HttptMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

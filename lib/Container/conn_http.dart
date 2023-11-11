import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

const BASEURL = 'https://naver.com';

class ConnHttp {
  Logger log = Logger();
  Dio dio = Dio(
      BaseOptions(
        baseUrl: BASEURL
      ));

  /// Function for http request
  ///
  /// @params: method, url, params
  /// @return: response
  Future<dynamic> request(String method, String url, Map<String, String>? params) async {
    final response = await dio.request(url,
      queryParameters: params,
      options: Options(method: method),
    );

    log.d("Http request is succeed\nResponse: $response");

    return response;
  }
}
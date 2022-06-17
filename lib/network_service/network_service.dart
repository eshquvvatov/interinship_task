import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:interinship_task/log_service/log_service.dart';

class NetworkService {


  static String SERVER_DEVELOPMENT = "https://jsonplaceholder.typicode.com/posts";


  static Map<String, String> getHeaders() {
    Map<String, String> headers = {'Content-type': 'application/json'};
    return headers;
  }



  static String getServer() {
    return SERVER_DEVELOPMENT;
  }

  /// /* Http Requests */

  static Future<String?> GET() async {
    try {
      Response response = await Dio(BaseOptions(
          baseUrl: getServer(),
          validateStatus: (status) => status! < 203,
          headers: getHeaders()))
          .get(SERVER_DEVELOPMENT, )
          .timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      LogService.d(response.data.toString());
      return jsonEncode(response.data);
    } on DioError catch (e) {
      // callLoginPage(e.response);
      if (e.response?.statusCode == 409) {

      }
      return null;
    }
  }




  /// /* Parsing */


}

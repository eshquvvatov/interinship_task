import 'dart:convert';
import 'package:http/http.dart';
import 'package:interinship_task/model/post_model.dart';

class Network {
  static bool isTester = true;

  static String SERVER_DEVELOPMENT = "jsonplaceholder.typicode.com";
  static String SERVER_PRODUCTION = "jsonplaceholder.typicode.com";

  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    return headers;
  }

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api, params); // http or https
    var response = await get(uri, headers: getHeaders());
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response =
    await post(uri, headers: getHeaders(), body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response =
    await put(uri, headers: getHeaders(), body: jsonEncode(params));
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api); // http or https
    var response =
    await patch(uri, headers: getHeaders(), body: jsonEncode(params));
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> DEL(String api, Map<String, dynamic> params) async {
    var uri = Uri.http(getServer(), api, params); // http or https
    var response = await delete(uri, headers: getHeaders());
    if (response.statusCode == 200) return response.body;
    return null;
  }

  /* Http Apis */
  static String API_Get_LIST = "/posts";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Params */
  static Map<String, dynamic> paramsEmpty() {
    Map<String, dynamic> params = {};
    return params;
  }

  /* Http Bodies */



  /* Http parsing */

  static List<Post> parseResponse(String response) {
    List json = jsonDecode(response);

     return json.map((e) => Post.fromJson(e)).toList();
  }
}

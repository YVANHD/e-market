import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _headers;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    _headers = {
      'Content-type' : 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try{
      Response response = await get(uri);
      return response;
    } catch(error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}
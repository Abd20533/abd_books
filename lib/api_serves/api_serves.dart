
import 'package:dio/dio.dart';

class ApiServices {
  static String host = "http://127.0.0.1:8000/api/";
  final Dio _dio;

  ApiServices(this._dio);
  Future<Map<String, dynamic>> getBooks({required String endBaseUrl}) async {
    Response response = await _dio.get(host + endBaseUrl);
    return response.data;
  }
}

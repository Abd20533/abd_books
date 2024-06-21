import 'package:dio/dio.dart';

class ApiServicesUser {
  static String host = "http://127.0.0.1:8000/api/";
  final Dio _dio;

  ApiServicesUser(this._dio);

  Future<Response> postUserSignUp(
      String name, int age, String email, String password) async {
    final String endPoint = "Register";
    Map<String, dynamic> body = {
      'name': name,
      'age': age,
      'email': email,
      'password': password,
    };
    // data: {
    //   'name': name,
    // 'age': age,
    // 'email': email,
    // 'password': password,
    // },

    try {
      Response response = await _dio.post(
        host + endPoint,
        data: body,
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      throw e;
    }
  }

  Future<Response> postUserLogIn(String email, String password) async {
    final String endPoint = "Register";
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };

    try {
      Response response = await _dio.post(
        host + endPoint,
        data: body,
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      throw e;
    }
  }

  Future<Response> postUserLost(String email) async {
    final String endPoint = "Register";
    Map<String, dynamic> body = {
      'email': email,
    };

    try {
      Response response = await _dio.post(
        host + endPoint,
        data: body,
      );
      return response;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      throw e;
    }
  }
}

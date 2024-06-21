import 'package:culturalspacelibrary/helper_with_dio/cash_helper.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  // static String token = "";
  static String token =
      CashHelper.getUserToken()! != "" ? CashHelper.getUserToken()! : "";
  CashHelper cashHelper = CashHelper();

  static init() {
    print("Dio");
    dio = Dio(
      BaseOptions(
        //http://192.168.8.209:8000
        //http://http://192.168.231.209:8000
        //http://192.168.104.209:8000
        //http://192.168.231.209:8000/api/code
        //192.168.104.209
        // 192.168.221.209
        //192.168.39.209
        //192.168.175.209:8000  192.168.39.209:8000
        baseUrl: 'http://192.168.175.209:8000/api/',
        // baseUrl: 'http://192.168.8.209:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> register({
    required String name,
    required String age,
    required String password,
    required String email,
  }) async {
    ///register
    print("register");
    print(name);
    print(age);
    print(password);
    print(email);
    return await dio.post('Register',
        data: {
          'name': name,
          'age': age,
          'password': password,
          'email': email,
        },
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> login(
      {required String email, required String password}) async {
    return await dio.post('Login',
        data: {'email': email, 'password': password},
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  static Future<Response> lost({required String email}) async {
    return await dio.post('Login',
        data: {'email': email},
        options: Options(
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  // static Future<Response> sure({required String code}) async {
  //   return await dio.post('code/',
  //       data: {"code": code},
  //       options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //             'Accept': 'application/json',
  //             'Content-Type': 'application/json',
  //           },
  //           followRedirects: false,
  //           validateStatus: (status) {
  //             return status! < 500;
  //           }));
  // }
  static Future<Response> sure({required String code}) async {
    int codeInt = int.tryParse(code) ?? 0;

    return await dio.post('code/',
        data: {"code": codeInt},
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

  static Future<Response> getHome({required String bath}) async {
    //books
    return await dio.get('$bath',
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return true;
            }));
  }

  static Future<Response> addToLibrary({required String id}) async {
    return await dio.post('library/add',
        data: {"book_id": id},
        options: Options(
            headers: {
              'Authorization': 'Bearer  $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }
}

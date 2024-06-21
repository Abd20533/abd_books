import 'dart:convert';

import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Books>> get(
      {required String url, @required Map<String, String>? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200 || response.statusCode <= 299) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem1 in  code get and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  Future<dynamic> post(
      {required url, required dynamic body, required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode <= 299) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in post code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  Future<dynamic> put(
      {required url, required dynamic body, required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode <= 299) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  post code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }

  Future<dynamic> delete({required url, required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode <= 299) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          '${jsonDecode(response.body)} there is a problem1 in  delete code and response.statusCode:'
          ' ${response.statusCode} ');
    }
  }
}

///to do
class ApiClient {
  final String baseUrl = 'https://api.example.com';

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return response;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final response =
        await http.post(Uri.parse('$baseUrl/$endpoint'), body: body);
    return response;
  }

  Future<http.Response> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
    return response;
  }

  Future<http.Response> update(
      String endpoint, Map<String, dynamic> body) async {
    final response =
        await http.put(Uri.parse('$baseUrl/$endpoint'), body: body);
    return response;
  }
}

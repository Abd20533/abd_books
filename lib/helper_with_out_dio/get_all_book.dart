import 'package:culturalspacelibrary/helper_with_out_dio/api.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:http/http.dart ' as http;

String host1 = "url";

class GetAllMedicinesService {
  Future<List<Books>> getAllMedicinesService() async {
    Map<String, String> token = {
      "Admin_Auth": "warehouseAdmin123",
    };
    List<dynamic> data = await Api().get(
      url: 'http://$host1:8000/api/admin/medicine',
      token: token,
    );

    List<Books> BookList =
        data.map((e) => Books.fromJson(e)).cast<Books>().toList();

    return BookList;
  }
}

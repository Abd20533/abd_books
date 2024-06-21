import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:dio/dio.dart';

class BookService {
  Dio? dio;

  Future<List<Books>> getBooks() async {
    List<Books> books = [];

    try {
      Response response = await dio!.get('https://api.example.com/books');

      if (response.statusCode == 200) {
        books = Books.fromJson(response.data) as List<Books>;
      } else {
        print('Failed to load books');
      }
    } catch (e) {
      print('Error: $e');
    }

    return books;
  }

  // Future<dynamic> postBook(Books book) async {
  //   try {
  //     Response response =
  //         await dio!.post('https://api.example.com/books', data: book.);
  //
  //     if (response.statusCode == 201) {
  //       return Books.fromJson(response.data);
  //     } else {
  //       print('Failed to create book');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }

  Future<bool> deleteBook(int bookId) async {
    try {
      Response response =
          await dio!.delete('https://api.example.com/books/$bookId');

      if (response.statusCode == 204 || response.statusCode == 201) {
        return true;
      } else {
        print('Failed to delete book');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  // Future<dynamic> putBook(int bookId, Books updatedBook) async {
  //   try {
  //     Response response = await dio!.put(
  //         'https://api.example.com/books/$bookId',
  //         data: updatedBook.toJson());
  //
  //     if (response.statusCode == 200) {
  //       return Books.fromJson(response.data);
  //     } else {
  //       print('Failed to update book');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     return null;
  //   }
  // }
}

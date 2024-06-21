import 'package:culturalspacelibrary/api_serves/api_serves.dart';
import 'package:culturalspacelibrary/errors/failures.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:culturalspacelibrary/repos/books_categories/repos_in_books_categories.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BooksCategoriesRepoImpl implements BooksCategoriesRepo {
  final ApiServices apiServes1;
  BooksCategoriesRepoImpl(this.apiServes1);
  @override

  /// to change dynamic to module Novels

  Future<Either<Failure, List<dynamic>>> fetchAuthor() async {
    try {
      /// to change   apiServes1 because return Book
      var data = await apiServes1.getBooks(endBaseUrl: "endBaseUrl");

      List<dynamic> booksBooksCategories = [];

      ///to do data[""]? because in jase file return  from {
      ///  name,
      ///  .....
      ///
      ///items:{}
      ///i want information in  items:{}
      ///}
      for (var item in data["items"]) {
        booksBooksCategories.add(Books.fromJson(item));
      }
      return right(booksBooksCategories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}

import 'package:culturalspacelibrary/api_serves/api_serves.dart';
import 'package:culturalspacelibrary/errors/failures.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:culturalspacelibrary/repos/home/repos_in_home.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServes;

  HomeRepoImpl(this.apiServes);

  @override
  Future<Either<Failure, List<Books>>> fetchFeaturedBooksAll() async {
    try {
      var data = await apiServes.getBooks(endBaseUrl: "endBaseUrl");

      List<Books> books = [];

      ///to do data[""]? because in jase file return  from {
      ///  name,
      ///  .....
      ///
      ///items:{}
      ///i want information in  items:{}
      ///}
      for (var item in data["items"]) {
        books.add(Books.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Books>>> fetchNewSetBooksTopRated() async {
    try {
      var data = await apiServes.getBooks(endBaseUrl: "endBaseUrl");

      List<Books> books = [];

      ///to do data[""]? because in jase file return  from {
      ///  name,
      ///  .....
      ///
      ///items:{}
      ///i want information in  items:{}
      ///}
      for (var item in data["items"]) {
        books.add(Books.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}

import 'package:culturalspacelibrary/api_serves/api_serves.dart';
import 'package:culturalspacelibrary/errors/failures.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:culturalspacelibrary/repos/library/repos_in_library.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LibraryRepoImpl implements Library {
  final ApiServices apiServes;

  LibraryRepoImpl(this.apiServes);

  @override
  Future<Either<Failure, List<Books>>> fetchSetBooksMyLibrary() async {
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

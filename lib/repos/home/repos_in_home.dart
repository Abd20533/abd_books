import 'package:culturalspacelibrary/errors/failures.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Books>>> fetchNewSetBooksTopRated();
  Future<Either<Failure, List<Books>>> fetchFeaturedBooksAll();
}

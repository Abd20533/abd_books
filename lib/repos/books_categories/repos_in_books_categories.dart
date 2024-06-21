import 'package:culturalspacelibrary/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BooksCategoriesRepo {
  /// to change dynamic to module Novels
  Future<Either<Failure, List<dynamic>>> fetchAuthor();
}

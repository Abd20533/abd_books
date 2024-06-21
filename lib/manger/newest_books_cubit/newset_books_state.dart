import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:equatable/equatable.dart';

abstract class NewSetBooksState extends Equatable {
  const NewSetBooksState();

  @override
  List<Object> get props => [];
}

class NewSetBooksInitial extends NewSetBooksState {}

class NewSetBooksLoading extends NewSetBooksState {}

class NewSetBooksSuccess extends NewSetBooksState {
  final List<Books> books;

  const NewSetBooksSuccess(this.books);
}

class NewSetBooksFailure extends NewSetBooksState {
  final String errMessage;

  const NewSetBooksFailure(this.errMessage);
}

part of 'fetch_set_books_my_Library_cubit.dart';

abstract class FeaturedBooksInLibraryState extends Equatable {
  const FeaturedBooksInLibraryState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksInLibraryState {}

class FeaturedBooksLoading extends FeaturedBooksInLibraryState {}

class FeaturedBooksFailure extends FeaturedBooksInLibraryState {
  final String errMessage;

  const FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksInLibrarySuccess extends FeaturedBooksInLibraryState {
  final List<Books> books;

  const FeaturedBooksInLibrarySuccess(this.books);
}

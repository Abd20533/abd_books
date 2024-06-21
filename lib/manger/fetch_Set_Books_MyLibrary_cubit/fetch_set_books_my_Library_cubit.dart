import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:culturalspacelibrary/repos/library/library_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_set_books_my_Library_state.dart';

class FeaturedSetBooksMyLibraryCubit
    extends Cubit<FeaturedBooksInLibraryState> {
  FeaturedSetBooksMyLibraryCubit(this.libraryRepo)
      : super(FeaturedBooksInitial());

  final LibraryRepoImpl libraryRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await libraryRepo.fetchSetBooksMyLibrary();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksInLibrarySuccess(books));
    });
  }
}

import 'package:culturalspacelibrary/manger/newest_books_cubit/newset_books_state.dart';
import 'package:culturalspacelibrary/repos/home/repos_in_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSetBooksCubit extends Cubit<NewSetBooksState> {
  NewSetBooksCubit(this.homeRepo) : super(NewSetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewSetBooksLoading());
    var result = await homeRepo.fetchFeaturedBooksAll();
    result.fold((failure) {
      emit(NewSetBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewSetBooksSuccess(books));
    });
  }
}

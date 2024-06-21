import 'package:bloc/bloc.dart';
import 'package:culturalspacelibrary/cubit/cubit7/book_authors_id_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';

class AuthorsBooksCubit extends Cubit<AuthorsBooksState> {
  AuthorsBooksCubit() : super(AuthorsBooksInitialState());
  static AuthorsBooksCubit get(context) => BlocProvider.of(context);

  late BookListResponse? booksList1;
  Future<void> booksAuthorsBooks({
    required String idAuthor,
    required context,
  }) async {
    emit(AuthorsBooksLoadingState());
    DioHelper.getHome(bath: "book/author/$idAuthor").then((value) async {
      print("${value.statusCode}+ books ");
      print("${value.data} ");
      if (value.statusCode == 404) {
        emit(AuthorsBooks404ErrorState());

        print(value.statusCode);
      }
      if (value.statusCode == 200) {
        BookListResponse booksList = BookListResponse.fromJson(value.data!);
        booksList1 = booksList;
        emit(AuthorsBooksSuccessState());

        print(value.statusCode);
      }
    }).catchError((error) {
      print(' error: ${error.toString()}');
      emit((AuthorsBooksErrorState()));
    });
  }
}

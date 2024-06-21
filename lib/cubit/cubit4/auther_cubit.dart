import 'package:culturalspacelibrary/cubit/cubit4/state_authors.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';

class BooksCategoriesCubit extends Cubit<AuthorsState> {
  BooksCategoriesCubit() : super(AuthorsInitialState());

  static BooksCategoriesCubit get(context) => BlocProvider.of(context);
  late AuthorResponse? authorResponseList1;

  ///2  Author
  Future<void> getHome4({
    required context,
  }) async {
    DioHelper.getHome(bath: "authors").then((value) async {
      print("authors" + "HomePage");
      int a = await value.statusCode!;
      print(value.data);
      AuthorResponse authorResponseList = AuthorResponse.fromJson(value.data!);
      authorResponseList1 = authorResponseList;
      if (a == 200) {
        AuthorResponse authorResponseList =
            AuthorResponse.fromJson(value.data!);
        authorResponseList1 = authorResponseList;
        emit(AuthorsSuccessState());
      }

      if (authorResponseList1!.authors.length != 0) {
        print("1123456789Home4SuccessState");

        emit(AuthorsSuccessState());
      } else if (authorResponseList.authors.length == 0) {
        print("1123456789Home2LoadingState");

        emit(AuthorsLoadingState());
      } else {
        print("1123456789");
      }
    }).catchError((error) {
      print("object" + "error");
      emit(AuthorsErrorState());

      print('register error: ${error.toString()}');
    });
  }
}

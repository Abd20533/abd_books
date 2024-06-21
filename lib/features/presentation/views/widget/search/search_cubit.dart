import 'package:culturalspacelibrary/cubit/cubit5/state_authors_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/search/search_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';

class SearchBodyCubit extends Cubit<SearchBodyState> {
  SearchBodyCubit() : super(SearchBodyInitialState());

  static SearchBodyCubit get(context) => BlocProvider.of(context);
  late AuthorResponse authorResponseList123;

  final GlobalKey<ScaffoldState> scaffoldKeyInAuthorsBody =
      GlobalKey<ScaffoldState>();

  Future<List<Author>> getSearch({required context}) async {
    emit(SearchBodyLoadingState());

    try {
      var value = await DioHelper.getHome(bath: "authors");
      if (value.statusCode == 200) {
        AuthorResponse authorResponseList =
            AuthorResponse.fromJson(value.data!);
        authorResponseList123 = authorResponseList;
        if (authorResponseList.authors.isNotEmpty) {
          return authorResponseList123.authors;
        }
        if (authorResponseList.authors.isEmpty) {
          emit(SearchBodyLoadingState());

          return [];
        } else {
          emit(SearchBodySuccessState());
        }
      } else {
        // التعامل مع رمز الحالة غير 200
        emit(SearchBodyErrorState());
      }
    } catch (error) {
      emit(SearchBodyErrorState());
      print('خطأ في جلب المؤلفين: ${error.toString()}');
    }
    return authorResponseList123.authors;
  }

  Future<List<Author>> getSearchWithQ(
      {required context, required String Q}) async {
    emit(SearchBodyLoadingState());

    try {
      var value = await DioHelper.getHome(bath: "authors" + "$Q");
      if (value.statusCode == 200) {
        AuthorResponse authorResponseList =
            AuthorResponse.fromJson(value.data!);
        authorResponseList123 = authorResponseList;

        if (authorResponseList.authors.isEmpty) {
          emit(SearchBodyLoadingState());
        } else {
          emit(SearchBodySuccessState());
        }
      } else {
        // التعامل مع رمز الحالة غير 200
        emit(SearchBodyErrorState());
      }
    } catch (error) {
      emit(SearchBodyErrorState());
      print('خطأ في جلب المؤلفين: ${error.toString()}');
    }

    return authorResponseList123.authors != null
        ? authorResponseList123.authors
        : [];
  }
}

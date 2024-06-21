// import 'package:culturalspacelibrary/cubit/cubit5/state_authors_body.dart';
// import 'package:culturalspacelibrary/import_package.dart';
// import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
//
// class AuthorsBodyCubit extends Cubit<AuthorsBodyState> {
//   AuthorsBodyCubit() : super(AuthorsBodyInitialState());
//
//   static AuthorsBodyCubit get(context) => BlocProvider.of(context);
//   late AuthorResponse authorResponseList123;
//   final GlobalKey<ScaffoldState> scaffoldKeyInAuthorsBody =
//       GlobalKey<ScaffoldState>();
//
//   ///2  Author
//   Future<void> getHome4({
//     required context,
//   }) async {
//     DioHelper.getHome(bath: "authors").then((value) async {
//       emit(AuthorsBodyInitialState());
//
//       // AuthorResponse authorResponseList = AuthorResponse.fromJson(value.data!);
//       // authorResponseList123 = authorResponseList;
//       if (value.statusCode == 200) {
//         print("object");
//         AuthorResponse authorResponseList =
//             AuthorResponse.fromJson(value.data!);
//         authorResponseList123 = authorResponseList;
//         emit(AuthorsBodySuccessState());
//       }
//       if (authorResponseList123.authors.length == 0) {
//         print("1123456789Home2LoadingState");
//
//         emit(AuthorsBodyLoadingState());
//       }
//     }).catchError((error) {
//       print("object  " + "error");
//       emit(AuthorsBodyErrorState());
//
//       print('register error: ${error.toString()}');
//     });
//   }
// }
import 'package:culturalspacelibrary/cubit/cubit5/state_authors_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';

class AuthorsBodyCubit extends Cubit<AuthorsBodyState> {
  AuthorsBodyCubit() : super(AuthorsBodyInitialState());

  static AuthorsBodyCubit get(context) => BlocProvider.of(context);
  late AuthorResponse authorResponseList123;

  final GlobalKey<ScaffoldState> scaffoldKeyInAuthorsBody =
      GlobalKey<ScaffoldState>();

  Future<void> getHome4({required context}) async {
    emit(AuthorsBodyLoadingState()); // الإشارة إلى أن الجلب قيد التقدم

    try {
      var value = await DioHelper.getHome(bath: "authors");
      if (value.statusCode == 200) {
        AuthorResponse authorResponseList =
            AuthorResponse.fromJson(value.data!);
        authorResponseList123 = authorResponseList;

        if (authorResponseList.authors.isEmpty) {
          emit(AuthorsBodyLoadingState());
        } else {
          emit(AuthorsBodySuccessState());
        }
      } else {
        // التعامل مع رمز الحالة غير 200
        emit(AuthorsBodyErrorState());
      }
    } catch (error) {
      emit(AuthorsBodyErrorState());
      print('خطأ في جلب المؤلفين: ${error.toString()}');
    }
  }
}

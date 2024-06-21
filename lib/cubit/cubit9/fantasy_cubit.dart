import 'package:culturalspacelibrary/cubit/cubit8/state_novels.dart';
import 'package:culturalspacelibrary/cubit/cubit9/state_fantastic.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';

class FantasyCubit extends Cubit<FantasyState> {
  FantasyCubit() : super(FantasyStateInitialState());

  static FantasyCubit get(context) => BlocProvider.of(context);
  final String authorImageUrl = AssetsData.imageBookNovels;
  final GlobalKey<ScaffoldState> scaffoldKeyInFantasyBody =
      GlobalKey<ScaffoldState>();
  late BookListResponse? booksList2;
  Future<void> fantasyBooks({
    required String idFantasy,
    required context,
  }) async {
    emit(FantasyStateLoadingState());
    DioHelper.getHome(bath: "book/type/$idFantasy").then((value) async {
      print("${value.statusCode}+ books ");
      print("${value.data} ");
      if (value.statusCode == 404) {
        emit(FantasyState404ErrorState());

        print(value.statusCode);
      }
      if (value.statusCode == 200) {
        BookListResponse booksList = BookListResponse.fromJson(value.data!);
        booksList2 = booksList;
        emit(FantasyStateSuccessState());

        print(value.statusCode);
      }
    }).catchError((error) {
      print(' error: ${error.toString()}');
      emit((FantasyStateErrorState()));
    });
  }
}

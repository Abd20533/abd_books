import 'package:culturalspacelibrary/cubit/cubit8/state_novels.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/modules_%20novels_dio.dart';

class NovelsCubit extends Cubit<NovelsState> {
  NovelsCubit() : super(NovelsStateInitialState());

  static NovelsCubit get(context) => BlocProvider.of(context);

  // final String authorImageUrl = AssetsData.imageBookNovels;
  final GlobalKey<ScaffoldState> scaffoldKeyInNovelsBody =
      GlobalKey<ScaffoldState>();
  NovelsListResponse? bookListResponse;
  Future<void> getBooksCategories({
    required context,
    required String qType,
  }) async {
    DioHelper.getHome(bath: "category/type/$qType").then((value) async {
      emit(NovelsStateLoadingState());

      print("category/type/$qType");
      print(value.data);
      print(value.statusCode);
      if (value.statusCode == 200) {
        NovelsListResponse booksCategoriesList =
            NovelsListResponse.fromJson(value.data!);
        bookListResponse = booksCategoriesList;
        emit(NovelsStateSuccessState());
      }
    }).catchError((error) {
      print("object" + "error");

      print('register error: ${error.toString()}');
      emit(NovelsStateErrorState());
    });
  }
}

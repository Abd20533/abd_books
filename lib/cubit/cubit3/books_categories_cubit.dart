import 'package:culturalspacelibrary/cubit/cubit3/state_books_categories_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_Category.dart';

class BooksCategoriesCubit extends Cubit<BooksCategoriesState> {
  BooksCategoriesCubit() : super(BooksCategoriesInitialState());

  static BooksCategoriesCubit get(context) => BlocProvider.of(context);
  late CategoryListResponse? categoriesList1;
  final String authorName = "Scientific And Literary";

  final String authorImageUrl = AssetsData.imageBookNovels;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ///2 BooksCategories
  Future<void> getBooksCategories({
    required context,
  }) async {
    DioHelper.getHome(bath: "categories").then((value) async {
      print("BooksCategories" + "HomePage");

      if (value.statusCode == 200) {
        print("BooksCategories");
        print(value.data);

        CategoryListResponse booksCategoriesList =
            CategoryListResponse.fromJson(value.data!);
        categoriesList1 = booksCategoriesList;
        if (booksCategoriesList.categories.length != 0) {
          emit(BooksCategoriesSuccessState());
        }
        print(booksCategoriesList.categories.length);
        if (booksCategoriesList.categories.length == 0) {
          emit(BooksCategoriesLoadingState());
        }
        print(value.statusCode);
      }
    }).catchError((error) {
      print("object" + "error");

      print('register error: ${error.toString()}');
      emit(BooksCategoriesErrorState());
    });
  }
}

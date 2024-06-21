import 'package:culturalspacelibrary/cubit/cubit2/home_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_Category.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Home1InitialState());
  //Sign in Form key
  static HomeCubit get(context) => BlocProvider.of(context);

  ///home
  TabController? tabControllerHome;

  final GlobalKey<ScaffoldState> scaffoldKeyHome = GlobalKey<ScaffoldState>();

  @override
  void initState({required TickerProvider tickerProvider}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // يسمح فقط بالوضع الرأسي العلوي
    ]);
    tabControllerHome = TabController(length: 4, vsync: tickerProvider);
  }
  //
  // void openDrawer(BuildContext context) {
  //   emit(HomeOpenState());
  //
  //   Scaffold.of(context).openEndDrawer();
  //   emit(HomeOpenState());
  // }

  ///1 Home1
  late BookListResponse? booksList1;
  late AuthorResponse? authorResponseList1;
  late CategoryListResponse? categoriesList1;
  Future<void> getHome1({
    required context,
  }) async {
    emit(Home1LoadingState());
    DioHelper.getHome(bath: "books").then((value) async {
      print("${value.statusCode}+ books ");

      if (value.statusCode == 200) {
        BookListResponse booksList = BookListResponse.fromJson(value.data!);
        booksList1 = booksList;
        emit(Home1SuccessState());

        print(value.statusCode);
      }
    }).catchError((error) {
      print(' error: ${error.toString()}');
      emit((Home1ErrorState()));
    });
  }

  ///2 Home
  Future<void> getHome2({
    required context,
  }) async {
    DioHelper.getHome(bath: "categories").then((value) async {
      print("categories" + "HomePage");
      print("${value.data}");
      print("${value.statusCode}+ categories ");
      if (value.statusCode == 200) {
        CategoryListResponse booksList =
            CategoryListResponse.fromJson(value.data!);
        categoriesList1 = booksList;
        print("${booksList.categories.length}");

        if (booksList.categories.length != 0) {
          emit(Home2SuccessState());
        }
        print(booksList.categories.length);
        if (booksList.categories.length == 0) {
          emit(Home2LoadingState());
        }
        print(value.statusCode);
      }
    }).catchError((error) {
      print("object  " + "error");

      print('register error: ${error.toString()}');
    });
  }

  ///3 Home
  Future<void> getHome3({
    required context,
  }) async {
    DioHelper.getHome(bath: "books").then((value) async {
      print("object" + "HomePage");
      int a = await value.statusCode!;

      if (a == 200) {}
    }).catchError((error) {
      print("object" + "error");
      emit(Home2ErrorState());

      print('register error: ${error.toString()}');
    });
  }

  ///4 Home
  Future<void> getHome4({
    required context,
  }) async {
    DioHelper.getHome(bath: "authors").then((value) async {
      print("authors" + "HomePage");
      int a = await value.statusCode!;
      print(value.data);
      print("${value.data}");
      print("${value.statusCode}+ authors ");
      AuthorResponse authorResponseList = AuthorResponse.fromJson(value.data!);
      authorResponseList1 = authorResponseList;

      if (a == 200) {
        AuthorResponse authorResponseList =
            AuthorResponse.fromJson(value.data!);
        authorResponseList1 = authorResponseList;
        emit(Home4SuccessState());
      }

      if (authorResponseList1!.authors.length != 0) {
        print("1123456789Home4SuccessState");

        emit(Home4SuccessState());
      } else if (authorResponseList.authors.length == 0) {
        print("Home2LoadingState");

        emit(Home2LoadingState());
      } else {
        print("1123456789");
      }
    }).catchError((error) {
      print("object" + "error");
      emit(Home4ErrorState());

      print('register error: ${error.toString()}');
    });
  }
}

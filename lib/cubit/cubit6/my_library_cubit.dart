import 'package:culturalspacelibrary/cubit/cubit6/my_library_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';

class MyLibraryCubit extends Cubit<MyLibraryState> {
  MyLibraryCubit() : super(MyLibraryInitialState());

  static MyLibraryCubit get(context) => BlocProvider.of(context);
  late BookListResponseMyLibrary? booksList1;

  bool b = false;
  TextEditingController PasswordControllerInMyLibraryBody =
      TextEditingController();

  final GlobalKey<ScaffoldState> ScaffoldKeyInMyLibraryBody =
      GlobalKey<ScaffoldState>();

  Future<void> getMyLibrary({required context}) async {
    DioHelper.getHome(bath: "library/books").then((value) async {
      print("" + "library/books");

      if (value.statusCode == 200) {
        print(value.data);

        BookListResponseMyLibrary booksList =
            BookListResponseMyLibrary.fromJson(value.data!);
        booksList1 = booksList;

        print(booksList1!.bookMyLibrary[1].book.image);
        print(booksList1);

        emit(MyLibrarySuccessState());
      } else {
        print("MyLibrary is null");

        emit(MyLibraryErrorState());
      }
    }).catchError((error) {
      print("object" + "error");
      emit(MyLibraryErrorState());

      print('register error: ${error.toString()}');
    });
  }

  Future<void> addToMyLibrary({required context, required String id}) async {
    DioHelper.addToLibrary(id: id).then((value) async {
      print("add" + "addToLibrary");
      int a = await value.statusCode!;
      print(value.data);

      if (a == 200) {
        myShowPopup(context,
            text: "ok add to my library ",
            path: "assets/Lottie/Animation15.json");
        emit(MyLibraryLoadingState());
      } else {
        print("MyLibrary is null");
        myShowPopup(context,
            text: "no add to my library becuse ${value.data}",
            path: "assets/Lottie/Animation15.json");
        emit(MyLibraryErrorState());
      }
    }).catchError((error) {
      print("object" + "error");
      emit(MyLibraryErrorState());

      print('register error: ${error.toString()}');
    });
  }
}

class BookMyLibrary {
  final int id;
  final int libraryId;
  final int bookId;
  final int conditionId;
  final int sign;
  final int readPages;
  final int progress;
  final Books book;

  BookMyLibrary({
    required this.id,
    required this.libraryId,
    required this.bookId,
    required this.conditionId,
    required this.sign,
    required this.readPages,
    required this.progress,
    required this.book,
  });

  factory BookMyLibrary.fromJson(Map<String, dynamic> json) {
//data['data'][0]['book']
    return BookMyLibrary(
      id: json['id'],
      libraryId: json['library_id'],
      bookId: json['book_id'],
      conditionId: json['condition_id'],
      sign: json['sign'],
      readPages: json['read_pages'],
      progress: json['progress'],
      book: Books.fromJson(json['book']),
    );
  }
}

class BookListResponseMyLibrary {
  final List<BookMyLibrary> bookMyLibrary;

  BookListResponseMyLibrary({required this.bookMyLibrary});

  factory BookListResponseMyLibrary.fromJson(dynamic json) {
    var bookMyLibraryJson = json['data'] as List;
    List<BookMyLibrary> bookMyLibraryList = bookMyLibraryJson
        .map((bookMyLibraryJson) => BookMyLibrary.fromJson(bookMyLibraryJson))
        .toList();
    return BookListResponseMyLibrary(bookMyLibrary: bookMyLibraryList);
  }
}
//
// class BookMyLibrary {
//   final int id;
//   final int library_id;
//   final int book_id;
//   final int condition_id;
//   final int sign;
//   final int read_pages;
//   final int progress;
//   final Books book;
//
//   BookMyLibrary({
//     required this.id,
//     required this.book_id,
//     required this.condition_id,
//     required this.library_id,
//     required this.progress,
//     required this.read_pages,
//     required this.sign,
//     required this.book,
//   });
//
//   factory BookMyLibrary.fromJson(Map<String, dynamic> json) {
//     return BookMyLibrary(
//       sign: json['status_id'],
//       read_pages: json['status_id'],
//       progress: json['status_id'],
//       library_id: json['status_id'],
//       condition_id: json['status_id'],
//       book_id: json['status_id'],
//       id: json['status_id'],
//       //json['type'] data['data'][0]['book']
//       book: Books.fromJson(json[0]['book']),
//     );
//   }
// }
//
// class BookListResponseMyLibrary {
//   final List<BookMyLibrary> bookMyLibrary; // تغيير الاسم إلى authors
//   BookListResponseMyLibrary({required this.bookMyLibrary});
//
//   factory BookListResponseMyLibrary.fromJson(dynamic json) {
//     var authorsJson = json['data'] as List;
//     print(authorsJson);
//
//     // تغيير المفتاح إلى data
//     List<BookMyLibrary> authorsList = authorsJson
//         .map((authorJson) => BookMyLibrary.fromJson(authorJson))
//         .toList();
//     return BookListResponseMyLibrary(bookMyLibrary: authorsList);
//   }
// }
///
//if (json['book']['id'] == null) {
//       print("FirstName is null");
//     }
//     if (json['book']['book_id'] == null) {
//       print("LastName is null");
//     }
//     if (json['book']['author_id'] == null) {
//       print("author_id is null");
//     }
//     if (json['book']['type_id'] == null) {
//       print("type_id is null");
//     }
//     if (json['book']['status_id'] == null) {
//       print("status_id is null");
//     }
//     if (json['book']['date_publication'] == null) {
//       print("date_publication is null");
//     }
//     if (json['book']['description'] == null) {
//       print("description is null");
//     }
//     if (json['book']['image'] == null) {
//       print("image is null");
//     }
//     if (json['book']['evaluation'] == null) {
//       print("evaluation is null");
//     }
//     if (json['book']['price'] == null) {
//       print("price is null");
//     }
//     if (json['book']['pages'] == null) {
//       print("pages is null");
//     }

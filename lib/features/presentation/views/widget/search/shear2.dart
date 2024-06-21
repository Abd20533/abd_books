// حالات البحث
import 'package:culturalspacelibrary/features/presentation/views/widget/search/search_cubit.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Author> authors;
  SearchSuccessState(this.authors);
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
}

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  void searchAuthors(String query) async {
    if (query.isEmpty) {
      // إذا كانت الاستعلام فارغًا، لا تفعل شيئًا أو يمكنك إعادة الحالة الأولية
      emit(SearchInitialState());
      return;
    }

    // تحميل البيانات
    emit(SearchLoadingState());
    try {
      // استدعاء الواجهة البرمجية للبحث عن المؤلفين
      List<Author> authors =
          await SearchBodyCubit().getSearchWithQ(Q: query, context: null);
      emit(SearchSuccessState(authors));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        // ... الكود المتبقي لواجهة المستخدم
        appBar: AppBar(
          // ... الكود المتبقي لشريط التطبيق
          title: TextFormField(
            // ... الكود المتبقي لحقل النص
            onChanged: (value) {
              // استدعاء cubit لبدء البحث
              context.read<SearchCubit>().searchAuthors(value);
            },
          ),
        ),
        body: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchErrorState) {
              // يمكنك عرض رسالة خطأ هنا
            }
          },
          builder: (context, state) {
            if (state is SearchLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SearchSuccessState) {
              return ListView.builder(
                itemCount: state.authors.length,
                itemBuilder: (context, index) {
                  return Container(); // ضع عنصر واجهة المستخدم لكل مؤلف هنا
                },
              );
            } else if (state is SearchErrorState) {
              return Center(child: Text(state.error));
            } else {
              return Container(); // حالة أولية أو حالة فارغة
            }
          },
        ),
      ),
    );
  }
}

/// my code is up No down
///
// الأحداث
abstract class SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final String query;

  SearchQueryChanged(this.query);
}

// الـ cubit
class SearchCubitTest extends Cubit<SearchState> {
  SearchCubitTest() : super(SearchInitialState());

  // ...

  void onSearchQueryChanged(String query) {
    if (query.isEmpty) {
      emit(SearchInitialState());
      return;
    }
    emit(SearchLoadingState());
    // تنفيذ البحث وتحميل البيانات
    /// searchAuthors(query);
  }

// ...
}

///
class SearchCubit2 extends Cubit<SearchState> {
  SearchCubit2() : super(SearchInitialState());

  // ...

  Future<void> searchAuthors(String query) async {
    emit(SearchLoadingState());
    try {
      // تنفيذ البحث وتحميل البيانات
      ///  List<Author> authors = await someRepository.searchAuthors(query);
      //emit(SearchSuccessState(authors));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }

// ...
}

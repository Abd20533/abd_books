import 'package:culturalspacelibrary/cubit/cubit10/state_mytheme.dart';
import 'package:culturalspacelibrary/import_package.dart';

class MyThemeCubit extends Cubit<MyThemeState> {
  MyThemeCubit(this.themeData) : super(ThemeStateInitialState());
  late final ThemeData themeData;
  static MyThemeCubit get(context) => BlocProvider.of(context);

  Future<void> chiangTheme({required bool theme, required context}) async {
    if (theme) {
      themeData = ThemeData.dark();
      MyThemeCubit(this.themeData);

      emit((ThemeStateDarkState()));
    }
    themeData = ThemeData.light();
    MyThemeCubit(this.themeData);

    return emit((ThemeStateLightState()));
  }
}

import 'package:culturalspacelibrary/constant/widgetes/widgetes.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/home_page.dart';
import 'package:culturalspacelibrary/features/presentation/views/sure.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/screen_login_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/sure_body.dart';
import 'package:culturalspacelibrary/helper_with_dio/cash_helper.dart';
import 'package:culturalspacelibrary/helper_with_dio/dio_helper.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/moudule_register.dart';
import 'package:culturalspacelibrary/modules_dio/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(LoginInitialState());
  //Sign in Form key
  static UserCubit get(context) => BlocProvider.of(context);

  ///1 InLogin
  ///

  ///2 InSngUn

  ///3 Lost

  Future<void> lost({
    required context,
    required String email,
  }) async {
    emit(LoginLoadingState());
    DioHelper.lost(
      email: email,
    ).then((value) async {
      print("object" + "HomePage");
      int a = await value.statusCode!;

      if (a == 200) {
        navigateAndFinish(context, SureBody());
        // navigateAndFinish(context, HomePage());

        emit(LoginSuccessState());
      }
    }).catchError((error) {
      print("object" + "error");

      print('register error: ${error.toString()}');
      emit(LoginErrorState());
    });
  }

  TextEditingController emailControllerInLostPasswordBody =
      TextEditingController();
  GlobalKey<FormState> formKeySngUnBodyInLostPasswordBody = GlobalKey();
  late String sErrorInLostPasswordBody = "";
  bool isErrorInLostPasswordBody = false;
  bool okCheekInLostPasswordBody = true;
  changeMyOkCheekInLostPasswordBody() {
    if (okCheekInLostPasswordBody) {
      okCheekInLostPasswordBody = false;
      if (!isErrorInLostPasswordBody) {
        isErrorInLostPasswordBody = true;
      }
      if (isErrorInLostPasswordBody) {
        isErrorInLostPasswordBody = false;
      }
      emit(LostOkCheekInLostPasswordBody());
    } else {
      okCheekInLostPasswordBody = true;
      emit(LostNotOkCheekInLostPasswordBody());
    }
  }

  ///4 sure

  Future<void> sure({
    required context,
    required String code,
  }) async {
    emit(LoginLoadingState());
    DioHelper.sure(
      code: code,
    ).then((value) async {
      if (value.statusCode == 200) {
        navigateAndFinish(context, HomePage());
        myShowPopup(context,
            text: "ok Sign up", path: "assets/Lottie/Animation15.json");
        emit(LoginSuccessState());
      }
      print(value.data);
    }).catchError((error) {
      print("object" + "error");
      print('register error: ${error.toString()}');
      emit(LoginErrorState());
    });
  }

  TextEditingController emailControllerInSureBody = TextEditingController();
  bool okCheekInSureBody = true;

  final formKeyInSureBody = GlobalKey<FormState>();

  changeMyOkCheekInSureBody() {
    if (okCheekInSureBody) {
      okCheekInSureBody = false;
      emit(SureColor());
    } else {
      okCheekInSureBody = true;
      emit(SureColor());
    }
  }

  ///5 sure
  void logout({required context}) {
    CashHelper.putUser(userToken: "");
    // print(CashHelper.getUserToken());
    navigateAndFinish(context, ScreenLoginBody());
  }

  navigateTo(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  navigateAndFinish(context, Widget widget) {
    myShowPopup(context,
        text: "ok Sign up", path: "assets/Lottie/Animation15.json");
    // Future.delayed(Duration(seconds: 3), () {
    //   Get.off(
    //         () => const HomePage(),
    //   );
    // });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }
}

class UserCubitRegister extends Cubit<UserState> {
  UserCubitRegister() : super(SngUpInitialState());

  //Sign in Form key
  static UserCubitRegister get(context) => BlocProvider.of(context);

  bool obscureTextInSngUnBody = true;
  bool okCheekInSngUnBody = true;
  bool myColorsInSngUn = true;

  void togglePasswordVisibilityInSngUnBody() {
    obscureTextInSngUnBody = !obscureTextInSngUnBody;
    if (obscureTextInSngUnBody) {
      emit(ObscureTextInSngUnBody());
    }
    if (!obscureTextInSngUnBody) {
      emit(NotObscureTextInSngUnBody());
    }
  }

  changeMyColorsInSngUn() {
    if (myColorsInSngUn) {
      myColorsInSngUn = false;
      emit(NotShownSngUnBody());
    } else {
      myColorsInSngUn = true;
      emit(ShownSngUnBody());
    }
  }

  TextEditingController nameFirstControllerInSngUn = TextEditingController();

  TextEditingController passwordControllerInSngUn = TextEditingController();
  TextEditingController emailControllerInSngUn = TextEditingController();
  TextEditingController ageControllerInSngUn = TextEditingController();

  GlobalKey<FormState> formKeyInSngUnBody = GlobalKey();

  DateTime? selectedDate; //DateTime? _selectedDate;
  String selectedDateText = '';
  // //
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedDateText = DateFormat('yyyy-MM-dd').format(picked);
      emit(OkDateSngUnBody());
    } else {
      emit(NotDateSngUnBody());
    }
  }

  ModuleRegisterField? moduleRegisterField;
  void register({
    required context,
    required String email,
    required String name,
    required String password,
    required String age,
  }) {
    emit(SngUpLoadingState());
    DioHelper.register(
      email: email,
      age: age,
      name: name,
      password: password,
    ).then((value) {
      if (value.statusCode == 422) {
        ModuleRegisterField moduleRegisterField2 =
            ModuleRegisterField.formJson(value.data);
        moduleRegisterField = moduleRegisterField2;

        emit(SngUpError422State());
      }
      if (value.statusCode == 200) {
        UserModel registerModel =
            UserModel.formJson(value.data, value.statusCode!);
        myShowPopup(context,
            text: "ok Register ", path: "assets/Lottie/Animation14.json");

        CashHelper.putUser(userToken: "");
        print("the token is${CashHelper.getUserToken()}");

        CashHelper.putUser(userToken: registerModel.user.token);

        Future.delayed(Duration(seconds: 2), () {
          navigateAndFinish(context, Sure());
        });
        emit(SngUpSuccessState());
      }

      ///
    }).catchError((error) {
      print('register error: ${error.toString()}');
      emit(SngUpErrorState());
    });
  }

  navigateTo(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  navigateAndFinish(context, Widget widget) {
    myShowPopup(context,
        text: "ok Sign up", path: "assets/Lottie/Animation15.json");
    // Future.delayed(Duration(seconds: 3), () {
    //   Get.off(
    //         () => const HomePage(),
    //   );
    // });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }
}

class UserCubitLogin extends Cubit<UserState> {
  UserCubitLogin() : super(LoginInitialState());
  //Sign in Form key
  static UserCubitLogin get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKeyInLoginBody = GlobalKey();
  TextEditingController emailControllerInLoginBody = TextEditingController();
  TextEditingController passwordControllerInLoginBody = TextEditingController();

  // //
  bool passwordIsShown = true;
  bool myColorsInLogIn = true;

  changeMyColorsInLogIn() {
    if (myColorsInLogIn) {
      myColorsInLogIn = false;
      emit(NotShownPassword());
    } else {
      myColorsInLogIn = true;
      emit(ShownPassword());
    }
  }

  changePasswordVisibility() {
    if (passwordIsShown) {
      passwordIsShown = false;
      emit(NotShownLogin());
    } else {
      passwordIsShown = true;
      emit(ShownLogin());
    }
  }

  Future<void> login({
    required context,
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.login(
      email: email,
      password: password,
    ).then((value) async {
      print("login" + "login");
      print(value.statusCode);

      int a = await value.statusCode!;

      UserModel userModel = UserModel.formJson(value.data!, a);

      if (userModel.statusCode == 200) {
        myShowPopup(context,
            text: "ok Login ", path: "assets/Lottie/Animation14.json");
        CashHelper.putUser(userToken: "");
        print("Token is ${CashHelper.getUserToken()}");

        CashHelper.putUser(userToken: userModel.user.token);

        print("object" + "${userModel.statusCode.toString()}");
        Future.delayed(Duration(seconds: 5), () {
          navigateAndFinish(context, HomePage());
        });
        emit(LoginSuccessState());
      }
    }).catchError((error) {
      print("object" + "error");

      print('register error: ${error.toString()}');
      emit(LoginErrorState());
    });
  }

  navigateTo(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  navigateAndFinish(context, Widget widget) {
    myShowPopup(context,
        text: "ok Sign up", path: "assets/Lottie/Animation15.json");
    // Future.delayed(Duration(seconds: 3), () {
    //   Get.off(
    //         () => const HomePage(),
    //   );
    // });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }
}

// Future.delayed(Duration(seconds: 5), () {
//   Get.off(
//     () => const HomePage(),
//     duration: const Duration(seconds: 1),
//   );
// });

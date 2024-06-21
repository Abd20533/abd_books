import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/get.dart';

class ScreenLoginBody extends StatelessWidget {
  const ScreenLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubitLogin(),
      child: BlocConsumer<UserCubitLogin, UserState>(
        builder: (context, state) {
          var login = UserCubitLogin.get(context);
          bool passwordIsShown = login.passwordIsShown;
          return Scaffold(
            body: Form(
              autovalidateMode: AutovalidateMode.always,
              key: login.formKeyInLoginBody,
              child: FadeInUp(
                duration: const Duration(seconds: 1),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: kColorTextFromScreenLogin.withOpacity(0.5),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            backgroundImage: const AssetImage(
                              AssetsData.imageSplashViewBody,
                            ),
                          ),
                        ).center(),
                        const SizedBox(
                          height: 20,
                        ),
                        myTextBold(text: "Login", color: c).center(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: ListTile(
                              title: Text("let's get you ready for your "),
                              subtitle: Text("reading journy")),
                        ),
                        mySizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: kColorTextScreenLogin,
                              fontSize: sizeTextScreenLogin),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        customTextFormField444(
                            col: kColorTextFromScreenLogin,
                            BorderRadiusCircular: 100,
                            controller: login.emailControllerInLoginBody,
                            type: TextInputType.emailAddress,
                            title: 'Enter your Email',
                            validationType: "email"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Password ",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: kColorTextScreenLogin,
                                fontSize: sizeTextScreenLogin)),
                        mySizedBox(
                          height: 10,
                        ),
                        onetextfromfaliedwithobTextinScreenSngUnBodyandLogin(
                          Password: login.passwordControllerInLoginBody,
                          obText: login.passwordIsShown,
                          callback: () {
                            login.changePasswordVisibility();
                          },
                        ),
                        mySizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: MaterialButton(
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              decoration: BoxDecoration(
                                color: login.myColorsInLogIn
                                    ? kColorTextFromScreenLogin.withOpacity(0.5)
                                    : Colors.red,
                                border: const Border(),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Log in ",
                                    style: TextStyle(
                                        fontSize: sizeTextScreenLogin),
                                  )),
                            ).center(),
                            onPressed: () async {
                              if (login.formKeyInLoginBody.currentState!
                                  .validate()) {
                                if (!login.myColorsInLogIn) {
                                  login.changeMyColorsInLogIn();
                                }
                                await login.login(
                                    context: context,
                                    email:
                                        login.emailControllerInLoginBody.text,
                                    password: login
                                        .passwordControllerInLoginBody.text);
                                // myShowPopup(context,
                                //     text: "ok Log in",
                                //     //assets\Lottie\Animation12.json
                                //     path: "assets/Lottie/Animation15.json");
                                // Future.delayed(
                                //   const Duration(seconds: 4),
                                //   () {
                                //     Get.off(
                                //       () => const HomePage(),
                                //       //  transition: Transition.downToUp,
                                //       duration: const Duration(seconds: 1),
                                //     );
                                //   },
                                // );
                              }
                              if (!login.formKeyInLoginBody.currentState!
                                  .validate()) {
                                if (login.myColorsInLogIn) {
                                  login.changeMyColorsInLogIn();
                                }
                              }
                            },
                          ),
                        ),
                        mySizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "forget your Password?",
                                style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 3,
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 2,
                                    decorationColor: Colors.green),
                              ).center().onTap(() {
                                Get.off(
                                  () => LostPassword(),
                                  duration: Duration(seconds: 1),
                                  //  transition: Transition.downToUp,
                                );
                              })
                            ]),
                        mySizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('already a member let\'s ',
                                style: TextStyle(color: Colors.black)),
                            Container(
                              width: 150,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenSngUp(),
                                      ));
                                },
                                child: const Text('Sign Up',
                                    style: TextStyle(color: c)),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: Center(
                            child: LottieBuilder.asset(
                                "assets/Lottie/Animation.json",
                                reverse: true,
                                repeat: true),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
//import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class BirthdateInput extends StatefulWidget {
//   @override
//   _BirthdateInputState createState() => _BirthdateInputState();
// }
//
// class _BirthdateInputState extends State<BirthdateInput> {
//   DateTime? _selectedDate;
//   String _selectedDateText = '';
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _selectedDateText = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('إدخال تاريخ الميلاد'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               _selectedDateText.isEmpty ? 'حدد تاريخ ميلادك' : _selectedDateText,
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('اختيار تاريخ'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

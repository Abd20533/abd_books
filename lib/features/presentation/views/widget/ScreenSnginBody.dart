import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/get.dart';

class ScreenSngUnBody extends StatelessWidget {
  const ScreenSngUnBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubitRegister(),
      child: BlocConsumer<UserCubitRegister, UserState>(
        builder: (context, state) {
          var sngUp = UserCubitRegister.get(context);

          return Form(
            autovalidateMode: AutovalidateMode.always,
            key: sngUp.formKeyInSngUnBody,
            child: Container(
                padding: const EdgeInsets.all(31),
                child: FadeInUp(
                  //curve: Curves.bounceIn,
                  duration: const Duration(seconds: 2),
                  delay: const Duration(milliseconds: 400),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            //alignment: Alignment.center,
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
                                "assets/images/abd3.png",
                              ),
                            ),
                          ).center(),
                          mySizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Create Account",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 28),
                          ).center(),
                          mySizedBox(
                            height: 20,
                          ),
                          if (state is SngUpError422State)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.red.withOpacity(0.2),
                                    // color: kColorTextScreenLogin.withOpacity(0.5),
                                  ),
                                  child: Text(
                                    sngUp.moduleRegisterField!.message,
                                    //"The email has already been taken ",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 16),
                                  ).center()),
                            ),
                          customTextFormField444(
                              col: kColorTextFromScreenLogin,
                              BorderRadiusCircular: 100,
                              controller: sngUp.nameFirstControllerInSngUn,
                              type: TextInputType.name,
                              title: 'First and Last Name',
                              validationType: "name"),
                          mySizedBox(
                            height: 10,
                          ),
                          customTextFormField444(
                              col: kColorTextFromScreenLogin,
                              BorderRadiusCircular: 20,
                              controller: sngUp.emailControllerInSngUn,
                              type: TextInputType.emailAddress,
                              title: 'Your Email Address',
                              validationType: "email"),
                          mySizedBox(
                            height: 10,
                          ),
                          onetextfromfaliedwithobTextinScreenSngUnBodyandLogin(
                            callback: () {
                              sngUp.togglePasswordVisibilityInSngUnBody();
                            },
                            obText: sngUp.obscureTextInSngUnBody,
                            Password: sngUp.passwordControllerInSngUn,
                          ),
                          mySizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(children: [
                              // Expanded(
                              //     child: customTextFormField444(
                              //   col: kColorTextFromScreenLogin,
                              //   controller: sngUp.ageControllerInSngUn,
                              //   type: TextInputType.datetime,
                              //   //TextInputType.
                              //   //numberWithOptions(),
                              //   title: "Your brith date",
                              //   validationType: "date",
                              //   BorderRadiusCircular: 50,
                              // )),
                              SizedBox(
                                child: InkWell(
                                    onTap: () => sngUp.selectDate(context),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: kColorTextFromScreenLogin
                                            .withOpacity(0.5),
                                      ),
                                      child: sngUp.selectedDateText == ""
                                          ? Text("enter please brith date")
                                              .center()
                                          : Text("${sngUp.selectedDateText}")
                                              .center(),
                                    )),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 40,
                              ),
                            ]),
                          ),
                          mySizedBox(
                            height: 5,
                          ),
                          if (state is SngUpInitialState ||
                              state is SngUpErrorState ||
                              state is ObscureTextInSngUnBody ||
                              state is NotObscureTextInSngUnBody ||
                              state is NotShownSngUnBody ||
                              // state is NotDateSngUnBody ||
                              state is OkDateSngUnBody ||
                              state is SngUpError422State ||
                              state is ShownSngUnBody)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: MaterialButton(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: sngUp.myColorsInSngUn
                                        ? kColorTextFromScreenLogin
                                            .withOpacity(0.5)
                                        : Colors.red,
                                    border: const Border(),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: sizeTextScreenLogin),
                                      )),
                                ).center(),
                                onPressed: () {
                                  if (sngUp.formKeyInSngUnBody.currentState!
                                      .validate()) {
                                    if (!sngUp.myColorsInSngUn) {
                                      sngUp.changeMyColorsInSngUn();
                                    }

                                    sngUp.register(
                                        context: context,
                                        email:
                                            sngUp.emailControllerInSngUn.text,
                                        name: sngUp
                                            .nameFirstControllerInSngUn.text,
                                        password: sngUp
                                            .passwordControllerInSngUn.text,
                                        age: sngUp.selectedDateText
                                        //    age: sngUp.ageControllerInSngUn.text
                                        );
                                  }
                                  if (!(sngUp.formKeyInSngUnBody.currentState!
                                      .validate())) {
                                    if (sngUp.myColorsInSngUn) {
                                      sngUp.changeMyColorsInSngUn();
                                    }

                                    showSnackBar(context,
                                        text: "information  error");

                                    sngUp.okCheekInSngUnBody = !true;
                                  }
                                },
                              ),
                            ),
                          if (state is SngUpLoadingState ||
                              state is SngUpSuccessState)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ).center(),
                          mySizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('already a member let\'s ',
                                  style: TextStyle(color: Colors.black)),
                              Container(
                                width: 70,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ScreenLogin(),
                                        ));
                                  },
                                  child: const Text('Login ',
                                      style: TextStyle(
                                        color: c,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decoration: TextDecoration.underline,
                                      )),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: SizedBox(
                              height: 200,
                              child: Center(
                                child: Image.asset(
                                  AssetsData.imageSplashViewBody,
                                ).center(),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
        listener: (BuildContext context, UserState state) {},
      ),
    );
  }
}
// myShowPopup(context,
//     text: "ok Sign up",
//     path: "assets/Lottie/Animation15.json");
// Future.delayed(Duration(seconds: 3), () {
//   Get.off(
//     () => const HomePage(),
//   );
// });

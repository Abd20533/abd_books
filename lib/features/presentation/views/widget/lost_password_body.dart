import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/sure_body.dart';
import 'package:culturalspacelibrary/import_package.dart';

import 'package:get/get.dart';

class LostPasswordBody extends StatefulWidget {
  const LostPasswordBody({super.key});

  @override
  State<LostPasswordBody> createState() => _LostPasswordBodyState();
}

class _LostPasswordBodyState extends State<LostPasswordBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var lost = UserCubit.get(context);

          return Form(
            key: lost.formKeySngUnBodyInLostPasswordBody,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
              child: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_sharp,
                          color: kColorTextScreenLogin, size: 20),
                    )),
                body: Container(
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        lost.okCheekInLostPasswordBody == !true
                            ? SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Card(
                                    elevation: 10,
                                    shadowColor: Colors.green,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color: Colors.green)),
                                    // $sErrorInLostPasswordBody
                                    child: Text(
                                      "     error in email",
                                      style: TextStyle(color: Colors.red),
                                    ).center()))
                            : const SizedBox(),
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
                              AssetsData.imageSplashViewBody,
                            ),
                          ),
                        ).center(),
                        const SizedBox(
                          height: 20,
                        ),
                        myTextBold(text: "Check  Your Account", color: c)
                            .center(),
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: Card(
                            elevation: 10,
                            shadowColor: Colors.green,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: kColorTextScreenLogin,
                                  fontSize: sizeTextScreenLogin),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: customTextFormField444(
                              col: kColorTextFromScreenLogin,
                              BorderRadiusCircular: 100,
                              controller:
                                  lost.emailControllerInLostPasswordBody,
                              type: TextInputType.emailAddress,
                              title: 'Enter your Email:',
                              validationType: "email"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: InkWell(
                            onTap: () async {
                              if (lost.formKeySngUnBodyInLostPasswordBody
                                  .currentState!
                                  .validate()) {
                                if (!lost.okCheekInLostPasswordBody) {
                                  lost.changeMyOkCheekInLostPasswordBody();
                                }

                                myShowPopup(context,
                                    text: "ok Sign up",
                                    path: "assets/Lottie/Animation15.json");
                                Future.delayed(Duration(seconds: 5), () {
                                  Get.off(
                                    () => const SureBody(),
                                    duration: const Duration(seconds: 1),
                                  );
                                });
                              } else {
                                if (lost.okCheekInLostPasswordBody) {
                                  lost.changeMyOkCheekInLostPasswordBody();
                                }
                              }
                            },
                            child: Container(
                              child: const Text(
                                "enter to confirm ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: kColorTextScreenLogin,
                                    fontSize: sizeTextScreenLogin),
                              ).center(),
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                color: lost.okCheekInLostPasswordBody
                                    ? kColorTextFromScreenLogin.withOpacity(0.5)
                                    : Colors.red,
                                //kColorTextFromScreenLogin,
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ).center(),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: Center(
                            child: LottieBuilder.asset(
                                "assets/Lottie/Animation7.json",
                                reverse: true,
                                repeat: true),
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

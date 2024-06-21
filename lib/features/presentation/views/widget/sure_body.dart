import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/screen_sngin.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/ScreenSnginBody.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/screen_login_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/route_manager.dart';

class SureBody extends StatelessWidget {
  const SureBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          var sure = UserCubit.get(context);
          return Scaffold(
            body: Form(
              key: sure.formKeyInSureBody,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey[100],
                        backgroundImage:
                            const AssetImage("assets/images/Screenshot2.jpg"),
                      ),
                    ).center(),
                    Container(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.0),
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.green,
                        child: Text(
                          "Confirm The Code",
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
                          controller: sure.emailControllerInSureBody,
                          type: TextInputType.number,
                          title: 'Enter your Email Confirm The Code:',
                          validationType: "Confirm"),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (sure.formKeyInSureBody.currentState!.validate()) {
                          sure.sure(
                              context: context,
                              code: sure.emailControllerInSureBody.text);
                          if (!sure.okCheekInLostPasswordBody) {
                            sure.changeMyOkCheekInSureBody();
                          }
                        } else {
                          if (sure.okCheekInLostPasswordBody) {
                            sure.changeMyOkCheekInSureBody();
                          }
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: sure.okCheekInLostPasswordBody
                            ? kColorTextFromScreenLogin
                            : Colors.red,
                        radius: 20,
                      ).center(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        CashHelper.putUser(userToken: "");
                        print(CashHelper.getUserToken());
                        sure.navigateAndFinish(context, ScreenLogin());

                        Get.back();
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        child: Text("Go to Register").center(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kColorTextFromScreenLogin,
                        ),
                      ).center(),
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

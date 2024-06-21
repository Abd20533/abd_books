// ignore: file_names
import 'dart:async';

import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:culturalspacelibrary/constant/widgetes/widgetes.dart';
import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/features/presentation/views/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animationOffset;
  late Animation<double> animationOpacity;
  late Animation<double> animationScale;
  bool b = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allAnimation();
//                  Get.to(search());
    Timer1();
    //Timer2();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text("Your Books",
                    style:
                        TextStyle(color: kColorTextScreenLogin, fontSize: 20))
                .center(),
          ),
          Container(
            //alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              color: c,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: const AssetImage(
                AssetsData.imageSplashViewBody,
              ),
            ),
          ).center(),
          const SizedBox(
            height: 10,
          ),
          const CircularProgressIndicator(
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          Center(
              child: myText(
                  text: 'Cultural Space Library',
                  color: kColorTextScreenLogin)),
          Center(
              child: FadeTransition(
            opacity: animationOpacity,
            child: SlideTransition(
              position: animationOffset,
              child: myText(
                  text: "Your Library",
                  color: b ? kColorTextScreenLogin : Colors.black,
                  fontSize: 34),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Align(
            child: Image.asset(
              AssetsData.imageSplashViewBody,
            ),
          ),
        ],
      ),
    );
  }

  void Timer1() {
    Timer(const Duration(seconds: 6), () {
      Get.offAll(
        () => const ScreenLogin(),
        transition: Transition.downToUp,
        duration: const Duration(seconds: 1),
      ); //Login()

      animationController.dispose();
    });
  }

  void Timer2() {
    Timer(const Duration(seconds: 5), () {
      animationController.stop();
      ChingController();
    });
  }

  void chaingB() {
    b = b ? false : true;
    setState(() {});

    ChingController();
  }

  void ChingController() {
    if (!b) {
      Timer(const Duration(seconds: 1), () {
        animationController.repeat();
        chaingB();
      });
    }

    if (b) {
      Timer(const Duration(seconds: 4), () {
        animationController.stop();
        chaingB();
      });
    }
  }

  void allAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),

      //reverseDuration: Duration(seconds: 4),
    );

    ///to dooo
    animationOffset = Tween<Offset>(end: Offset.zero, begin: const Offset(0, 1))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear));
    // animationOffset.addListener(() {
    //   setState(() {});
    // });
    animationOpacity = Tween<double>(end: 0.2, begin: 1.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: animationController));
    animationScale = Tween<double>(begin: 0.4, end: 2).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeInCubic));
    animationController.repeat(reverse: true);
  }
}

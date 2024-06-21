import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:culturalspacelibrary/import_package.dart';

class SplashViewBody2 extends StatefulWidget {
  const SplashViewBody2({super.key});

  @override
  State<SplashViewBody2> createState() => _SplashViewBody2State();
}

class _SplashViewBody2State extends State<SplashViewBody2>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationOpacity;
  bool b = true;

  void allAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
    );

    animationOpacity = Tween<double>(end: 0.2, begin: 1.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: animationController));

    animationController.repeat(reverse: true);
    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //animationController.dispose();
    animationController.stop();
    super.dispose();
  }

  get splash => null;
  @override
  void initState() {
    super.initState();
    allAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [
        FadeInUp(
          curve: Curves.bounceIn,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeTransition(
              opacity: animationOpacity,
              child: const Text("Your Books",
                      style: TextStyle(color: Color(0xff059669), fontSize: 30))
                  .center(),
            ),
          ),
        ),
        FadeInLeft(
          curve: Curves.bounceIn,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 1000),
          child: Container(
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
        ),

        const SizedBox(height: 20),
        FadeInRight(
          curve: Curves.bounceIn,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 1500),
          child: Center(
              child: myText(
                  text: 'Cultural Space Library',
                  color: kColorTextScreenLogin)),
        ),

        ///to
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Center(
            child: LottieBuilder.asset("assets/Lottie/Animation.json",
                repeat: true),
          ),
        ),

        FadeInUp(
          curve: Curves.bounceIn,
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 2000),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ),
      ]),
      nextScreen: const ScreenSngUp(),
      splashIconSize: 600,
      curve: Curves.bounceIn,
      duration: 7000,
      backgroundColor: kcolor,
    );
  }
}

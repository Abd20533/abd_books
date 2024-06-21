import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/screen_login_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLoginBody();
  }
}

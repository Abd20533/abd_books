import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/lost_password_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LostPassword extends StatelessWidget {
  const LostPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LostPasswordBody();
  }
}

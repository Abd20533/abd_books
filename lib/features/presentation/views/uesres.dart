import 'package:culturalspacelibrary/features/presentation/views/widget/users_body.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UsersBody(),
    );
  }
}

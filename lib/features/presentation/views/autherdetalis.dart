import 'package:culturalspacelibrary/features/presentation/views/widget/authorsDataLisBody.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
import 'package:flutter/material.dart';

///to add author
class AuthorsDataLis extends StatelessWidget {
  final Author author;
  const AuthorsDataLis({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthorsDataListBody(
        authors: author,
      ),
    );
  }
}

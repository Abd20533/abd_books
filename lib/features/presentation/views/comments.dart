import 'package:culturalspacelibrary/features/presentation/views/widget/books_categories_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/comments_body.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommentsBody(),
    );
  }
}

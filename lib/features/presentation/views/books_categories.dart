import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/books_categories_body.dart';
import 'package:flutter/material.dart';

class BooksCategories extends StatelessWidget {
  const BooksCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BooksCategoriesBody(),
    );
  }
}

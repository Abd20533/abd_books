import 'package:culturalspacelibrary/features/presentation/views/widget/screen_book_body.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:flutter/material.dart';

class ScreenBook extends StatelessWidget {
  final String pathImage;
  final String? pathPdf;
  final String idBook;
  final dynamic evaluation;
  final Books book;

  const ScreenBook(
      {Key? key,
      required this.pathImage,
      this.pathPdf,
      required this.idBook,
      required this.evaluation,
      required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ScreenBookBody(
          book: book,
          evaluation: evaluation,
          id: idBook!,
          pathImage: pathImage,
          pathPdf: pathPdf!,
        ),
      ),
    );
  }
}

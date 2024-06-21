import 'package:culturalspacelibrary/cubit/cubit8/novels_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit8/state_novels.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/novels_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class Novels extends StatelessWidget {
  final String qType;
  const Novels({super.key, required this.qType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NovelsCubit()..getBooksCategories(context: context, qType: qType),
      child: BlocConsumer<NovelsCubit, NovelsState>(
        builder: (context, state) {
          if (state is NovelsStateSuccessState) {
            return Scaffold(
              body: NovelsBody(
                qType: qType!,
              ),
            );
          }

          if (state is NovelsStateLoadingState) {
            return CircularProgressIndicator().center();
          }
          return CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.red,
          ).center();
        },
        listener: (context, state) {},
      ),
    );
  }
}

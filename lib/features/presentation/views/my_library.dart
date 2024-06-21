import 'package:culturalspacelibrary/cubit/cubit6/my_library_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit6/my_library_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/my_library_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  final String pathImage;
  MyLibrary({Key? key, required this.pathImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyLibraryCubit()..getMyLibrary(context: context),
      child: BlocConsumer<MyLibraryCubit, MyLibraryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: MyLibraryBody(pathImage: ""),

            // Container(color: Colors.red),
          );
        },
      ),
    );
  }
}

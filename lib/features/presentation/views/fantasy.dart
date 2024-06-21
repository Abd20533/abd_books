import 'package:culturalspacelibrary/cubit/cubit9/fantasy_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit9/state_fantastic.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/fantasy_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:flutter/material.dart';

class Fantasy extends StatelessWidget {
  final String idFantasy;

  const Fantasy({super.key, required this.idFantasy});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FantasyCubit()..fantasyBooks(context: context, idFantasy: idFantasy),
      child: BlocConsumer<FantasyCubit, FantasyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: FantasyBody(
            idFantasy: idFantasy,
          ));
        },
      ),
    );
  }
}

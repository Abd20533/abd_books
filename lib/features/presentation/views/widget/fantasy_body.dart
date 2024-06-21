import 'package:culturalspacelibrary/cubit/cubit9/fantasy_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit9/state_fantastic.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:dartz/dartz.dart';

class FantasyBody extends StatelessWidget {
  final String idFantasy;
  const FantasyBody({super.key, required this.idFantasy});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FantasyCubit()
        ..fantasyBooks(context: context, idFantasy: "$idFantasy"),
      child: BlocConsumer<FantasyCubit, FantasyState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bookFantasy = FantasyCubit.get(context);

          if (state is FantasyStateSuccessState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scaffold(
                  key: bookFantasy.scaffoldKeyInFantasyBody,
                  appBar: myAppBarInFantasyBody(
                      scaffoldKey1: bookFantasy.scaffoldKeyInFantasyBody),
                  // backgroundColor: const Color(0xffF1F5F9),
                  endDrawer: displayEndDrawer(
                      scaffoldKey1: bookFantasy.scaffoldKeyInFantasyBody),
                  body: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 12, right: 12),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                color: const Color(0xffF1F5F9),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          cardInFantasyBody(
                                        books: bookFantasy
                                            .booksList2!.books[index],
                                        nameImage: bookFantasy
                                            .booksList2!.books[index].image!,
                                        //        (index + 1).toString()
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 20,
                                      ),
                                      itemCount:
                                          bookFantasy.booksList2!.books.length,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }
          if (state is FantasyState404ErrorState) {
            return const Text("not found 404").center();
          }
          if (state is FantasyStateErrorState) {
            return const Text("not found").center();
          }
          if (state is FantasyStateLoadingState) {
            return CircularProgressIndicator().center();
          }
          return CircularProgressIndicator(
            color: Colors.red,
          ).center();
        },
      ),
    );
  }
}

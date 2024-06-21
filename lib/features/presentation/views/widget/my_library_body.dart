import 'package:culturalspacelibrary/cubit/cubit6/my_library_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit6/my_library_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/screen_book_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:get/get.dart';

class MyLibraryBody extends StatelessWidget {
  const MyLibraryBody({super.key, required this.pathImage});
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyLibraryCubit()..getMyLibrary(context: context),
      child: BlocConsumer<MyLibraryCubit, MyLibraryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var myLibraryCubit = MyLibraryCubit.get(context);
          if (state is MyLibraryErrorState) {
            return CircularProgressIndicator(
              color: Colors.red,
            ).center();
          }
          if (state is MyLibraryLoadingState ||
              state is MyLibraryInitialState) {
            return CircularProgressIndicator().center();
          }
          return Scaffold(
              key: myLibraryCubit.ScaffoldKeyInMyLibraryBody,
              endDrawer: displayEndDrawer(
                  scaffoldKey1: myLibraryCubit.ScaffoldKeyInMyLibraryBody),
              appBar: myAppBarInMyProfile(
                  scaffoldKey1: myLibraryCubit.ScaffoldKeyInMyLibraryBody,
                  title: "My Library"),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: myLibraryCubit.b != false
                      ? Column(
                          children: [
                            // pPadding(),
                            GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1, mainAxisExtent: 222),
                                itemCount: myLibraryCubit
                                    .booksList1!.bookMyLibrary.length,
                                itemBuilder: (context, index) {
                                  return mB(
                                      book: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book,
                                      evaluation: 1,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      height: 180,
                                      nameImage: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book.image!,
                                      nameText2: "Harry Potter",
                                      nameText: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book.firstName
                                          .toString());
                                })
                          ],
                        )
                      : Column(
                          children: [
                            // pPadding(),
                            GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 200,
                                        mainAxisSpacing:
                                            BorderSide.strokeAlignCenter,
                                        crossAxisSpacing:
                                            BorderSide.strokeAlignCenter),
                                itemCount: myLibraryCubit
                                    .booksList1!.bookMyLibrary.length,

                                ///myLibraryCubit.booksList1!.length,
                                itemBuilder: (context, index) {
                                  return mB(
                                      book: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book,
                                      evaluation: 2,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height: 160,
                                      nameImage: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book.image!,
                                      nameText2: "Harry Potter",
                                      nameText: myLibraryCubit.booksList1!
                                          .bookMyLibrary[index].book.firstName
                                          .toString());
                                })
                          ],
                        ),
                ),
              ));
        },
      ),
    );
  }
}

AppBar myAppBarInMyProfile(
    {required GlobalKey<ScaffoldState> scaffoldKey1, required String title}) {
  return AppBar(
    elevation: 0,
    leading: Card(
      elevation: 3,
      surfaceTintColor: Colors.grey,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: kcolor,
          border: Border.all(color: const Color(0xff22C55E), width: 1),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              Get.back();

              ;
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Color(0xff34D399),
              size: 20,
            ),
          ),
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      "$title",
      style: const TextStyle(color: Color(0xff34D399), fontSize: 18),
    ),
    actions: [
      Card(
        elevation: 3,
        surfaceTintColor: Colors.grey,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: kcolor,
            border: Border.all(color: const Color(0xff22C55E), width: 1),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                print("object");
                scaffoldKey1.currentState!
                    .openEndDrawer(); // لفتح الـ endDrawer
              },
              icon: const Icon(
                Icons.more_horiz_outlined,
                color: Color(0xff34D399),
                size: 20,
              ),
            ).center(),
          ),
        ),
      ),
    ],
    backgroundColor: kcolor,
  );
}

Widget mB(
    {required double height,
    required String nameImage,
    required String nameText,
    required String nameText2,
    required double width,
    required Books book,
    required double evaluation}) {
  return SizedBox(
    height: height,
    width: width,
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          nameText.substring(0, 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: kColorDisplay2InHomePage),
        ).center(),
      ),
      Divider(color: Colors.green, endIndent: 40, thickness: 1, indent: 40),
      Card(
        elevation: 10,
        shadowColor: Colors.green,
        color: Colors.transparent,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          width: width,
          height: height - 10,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(nameImage),
              //AssetImage(nameImage),
            ),
          ),
        ).onTap(() {
          Get.to(ScreenBookBody(
            pathPdf: book.lastName!,

            id: book.id.toString(),
            book: book,
            evaluation: book.evaluation,
            //  idBook: book.id.toString(),
            pathImage: book.image!,
          ));
        }),
      ),
    ]),
  );
}

Widget myBookInMyLibraryBody(
    {required String nameImage,
    required String nameText,
    required String nameText2,
    required double height,
    required double evaluation,
    required Books book,
    required double width}) {
  return SizedBox(
    height: height,
    child: Column(children: [
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(nameImage),
          ),
        ),
      ).onTap(() {
        Get.to(ScreenBook(
          book: book,
          evaluation: evaluation,
          idBook: "8",
          pathImage: nameImage,
        ));
      }),
      Text(
        nameText,
        style: const TextStyle(color: kColorDisplay2InHomePage),
      ).center(),
      // SizedBox(height: 20),
      // Text(nameText2),
    ]),
  );
}
// if (myLibraryCubit.booksList1!
//             .bookMyLibrary[index].book ==
//         "" ||
//     myLibraryCubit.booksList1!
//             .bookMyLibrary[index].book ==
//         null) {
//   print("book is null");
// }
// ;
// if (myLibraryCubit!.booksList1!
//             .bookMyLibrary[index].book !=
//         "" ||
//     myLibraryCubit.booksList1!
//             .bookMyLibrary[index].book !=
//         null) {
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.image);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.id);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.evaluation);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.description);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.statusId);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.typeId);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.pages);
//   print(myLibraryCubit.booksList1!
//       .bookMyLibrary[index].book.statusId);
//   print("book is not null");
// }
// ;

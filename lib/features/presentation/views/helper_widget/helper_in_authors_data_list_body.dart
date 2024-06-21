import 'package:culturalspacelibrary/cubit/cubit7/authors_books_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit7/book_authors_id_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/helper_widget/helper_in_home_page.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

Widget booksInTabBar2InAuthorsDataListBody(
    {required double height, required String id}) {
  return BlocProvider(
    create: (context) =>
        AuthorsBooksCubit()..booksAuthorsBooks(idAuthor: id, context: context),
    child: BlocConsumer<AuthorsBooksCubit, AuthorsBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bookAuthors = AuthorsBooksCubit.get(context);
        if (state is AuthorsBooksSuccessState) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 10),
                    child: const Text(
                      "Top Books",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 76, 161, 80)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Row(
                                children: [
                                  Container(
                                    height: 200,
                                    child: Image.network(
                                      height: 200,
                                      bookAuthors
                                          .booksList1!.books[index].image!,
                                    ),
                                  ).onTap(() {
                                    Get.to(ScreenBook(
                                      book:
                                          bookAuthors.booksList1!.books[index],
                                      evaluation: bookAuthors
                                          .booksList1!.books[index].evaluation,
                                      idBook: bookAuthors
                                          .booksList1!.books[index].id
                                          .toString(),
                                      pathPdf: bookAuthors
                                          .booksList1!.books[index].lastName!,
                                      pathImage: bookAuthors
                                          .booksList1!.books[index].image!,
                                    ));
                                  }),
                                  const VerticalDivider(
                                      indent: 10,
                                      endIndent: 10,
                                      width: 4,
                                      thickness: 3,
                                      color: Color(0xff34D399)),
                                  Container(
                                    color: Colors.white,
                                    height: 220,
                                    width: 205,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.0),
                                          child: ListTile(
                                            title: Text("Vision in White",
                                                style: TextStyle(
                                                    color: Color(0xff34D399))),
                                            subtitle: Text(
                                              bookAuthors.booksList1!
                                                  .books[index].description!,

                                              // "$description",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff065F46)),
                                              maxLines: 7,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 6.0, right: 4, left: 4),
                                          child: Container(
                                            height: 20,
                                            child: Row(
                                              children: [
                                                Text("❤❤"),
                                                Spacer(),
                                                Text("Novel, Romance ",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff065F46))),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ).onTap(
                                    () {},
                                  ),
                                ],
                              ),
                          // myContainerInDisplay2InHomePage(
                          //     pdfPath: bookAuthors
                          //         .booksList1!.books[index].lastName,
                          //     nameImage: bookAuthors
                          //         .booksList1!.books[index].image
                          //         .toString(),
                          //     //nameImage: 'assets/images/A4.png',
                          //     nameText: bookAuthors
                          //         .booksList1!.books[index].firstName
                          //         .toString(),
                          //     // nameText: "nameText",
                          //     nameText2: bookAuthors
                          //         .booksList1!.books[index].price
                          //         .toString()
                          //     //    nameText2: "abd"
                          //
                          //     ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 6,
                                child: VerticalDivider(
                                    indent: 0,
                                    endIndent: 40,
                                    width: 4,
                                    thickness: 3,
                                    color: Color(0xff34D399)),
                              ),
                          itemCount: bookAuthors.booksList1!.books.length),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(left: 15, bottom: 10),
                  //   child: const Text(
                  //     "New",
                  //     style: TextStyle(
                  //         fontSize: 20,
                  //         color: Color.fromARGB(255, 76, 161, 80)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: SizedBox(
                  //     height: 200,
                  //     child: ListView.separated(
                  //         scrollDirection: Axis.horizontal,
                  //         itemBuilder: (context, index) =>
                  //             myContainerInDisplay2InHomePage(
                  //                 nameImage: 'assets/images/A4.png',
                  //                 nameText: "nameText",
                  //                 nameText2: "abd"),
                  //         separatorBuilder: (context, index) => const SizedBox(
                  //               width: 6,
                  //               child: VerticalDivider(
                  //                   indent: 0,
                  //                   endIndent: 40,
                  //                   width: 4,
                  //                   thickness: 3,
                  //                   color: Color(0xff34D399)),
                  //             ),
                  //         itemCount: 20),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }
        if (state is AuthorsBooksLoadingState) {
          return CircularProgressIndicator().center();
        }
        if (state is AuthorsBooks404ErrorState) {
          return Text(
            "not found",
            style: TextStyle(fontSize: 29),
          ).center();
        }
        return Text(
          "server",
          style: TextStyle(fontSize: 29),
        ).center();
      },
      //child:
    ),
  );
}

Widget InfoInTabInAuthorsDataListBody(
    {required String information,
    required String born,
    required context,
    required String birthPlace}) {
  return SizedBox(
    height: 450,
    child: Column(
      children: [
        Container(
          height: 150,
          margin:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, top: 10, bottom: 7, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                // width: 2,
                color: const Color.fromARGB(255, 114, 241, 118),
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 50,
                  spreadRadius: -20,
                )
              ]),
          child: Column(
            children: [
              //the born
              Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 145, 243, 149),
                  border: Border.all(
                    // width: 2,
                    color: const Color.fromARGB(255, 145, 243, 149),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        born.substring(0, 11), overflow: TextOverflow.clip,
                        //    "born:31 july 1980"
                      ),
                      width: MediaQuery.of(context).size.width / 4 - 10,
                    ),
                    // ignore: prefer_const_constructors
                    Container(
                      child: Text("birth place:" + birthPlace),
                      width: MediaQuery.of(context).size.width / 2 - 10,
                    )
                  ],
                ),
              ),
              //the education
              Container(
                padding: const EdgeInsets.all(5),
                //  height: 50,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  color: Color.fromARGB(255, 145, 243, 149),
                  border: Border.all(
                    // width: 2,
                    color: const Color.fromARGB(255, 145, 243, 149),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  const Text("Education"),
                  Container(
                    height: 20,
                    width: 300,
                    child: Text(
                      maxLines: 1,
                      "french and classical degree at Exeter Universitr",
                      textAlign: TextAlign.center,
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Container(
            ///akaih

            // height: 170,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 114, 241, 118),
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff4ADE70),
                    blurRadius: 50,
                    spreadRadius: -20,
                  )
                ]),

            child: SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    information,
                    style:
                        const TextStyle(color: Color(0xff065F46), fontSize: 16),
                  )
                ],
              ),
            ),

            ///
            //Text(about),
          ),
        )
      ],
    ),
  );
}

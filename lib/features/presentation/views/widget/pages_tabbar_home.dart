import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/features/presentation/views/screen_book.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget display1InHomePageUpTopRated1(
    {required String im,
    required double evaluation,
    required Books book,
    int? count,
    String? pathImage,
    required String idBook}) {
  return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              child: Row(
            children: [
              Container(
                height: 200,
                child: pathImage == (null)
                    ? Image.asset(
                        height: 200,
                        'assets/images/5598113.png',
                      )
                    : Image.network(
                        height: 200,

                        "$pathImage",
                        //"assets/images/Scroll Group 8.png",
                      ),
              ).onTap(() {
                Get.to(ScreenBook(
                  book: book,
                  evaluation: evaluation,
                  idBook: idBook,
                  pathImage: pathImage!,

                  /// pathImage: 'assets/images/5598113.png',
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
                            style: TextStyle(color: Color(0xff34D399))),
                        subtitle: Text(
                          "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff065F46)),
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6.0, right: 4, left: 4),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Text("❤❤"),
                            Spacer(),
                            Text("Novel, Romance ",
                                style: TextStyle(color: Color(0xff065F46))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ).onTap(
                () {},
              ),

              ///2
              const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  width: 4,
                  thickness: 3,
                  color: Color(0xff34D399)),
              InkWell(
                  onTap: () {
                    Get.to(ScreenBook(
                      book: book,
                      evaluation: evaluation,
                      idBook: idBook,
                      pathImage: 'assets/images/A3.png',
                    ));
                  },
                  child: Container(
                    height: 200,
                    width: 150,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/A3.png',
                        ),
                      ),
                    ),
                    // child: Image.asset(
                    //   "$im",
                    //   height: 200,
                    // ),
                  )),
              const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  width: 4,
                  thickness: 3,
                  color: Color(0xff34D399)),
              const SizedBox(
                width: 5,
              ),
              Container(
                color: Colors.white,
                height: 220,
                width: 205,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: ListTile(
                        title: Text("Vision in White",
                            style: TextStyle(color: Color(0xff34D399))),
                        subtitle: Text(
                          "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff065F46)),
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, right: 4, left: 4),
                      child: Row(
                        children: [
                          Text("❤❤"),
                          Spacer(),
                          Text("Novel, Romance ",
                              style: TextStyle(color: Color(0xff065F46))),
                        ],
                      ),
                    )
                  ],
                ),
              ).onTap(
                () {},
              ),
              const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  width: 4,
                  thickness: 3,
                  color: Color(0xff34D399)),
              InkWell(
                  onTap: () {
                    Get.to(ScreenBook(
                      book: book,
                      evaluation: evaluation,
                      idBook: idBook,
                      pathImage: 'assets/images/A4.png',
                    ));
                  },
                  child: Container(
                    height: 200,
                    width: 150,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/A4.png',
                        ),
                      ),
                    ),
                    // child: Image.asset(
                    //   "$im",
                    //   height: 200,
                    // ),
                  )),
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
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: ListTile(
                        title: Text("Vision in White",
                            style: TextStyle(color: Color(0xff34D399))),
                        subtitle: Text(
                          "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff065F46)),
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, right: 4, left: 4),
                      child: Row(
                        children: [
                          Text("❤❤"),
                          Spacer(),
                          Text("Novel, Romance ",
                              style: TextStyle(color: Color(0xff065F46))),
                        ],
                      ),
                    )
                  ],
                ),
              ).onTap(
                () {},
              ),
              const SizedBox(
                width: 5,
              ),
              const VerticalDivider(
                  indent: 10,
                  endIndent: 10,
                  width: 4,
                  thickness: 3,
                  color: Color(0xff34D399)),
              InkWell(
                  onTap: () {
                    Get.to(ScreenBook(
                      book: book,
                      evaluation: evaluation,
                      idBook: idBook,
                      pathImage: 'assets/images/A2.png',
                    ));
                  },
                  child: Container(
                    height: 200,
                    width: 150,

                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/A2.png',
                        ),
                      ),
                    ),
                    // child: Image.asset(
                    //   "$im",
                    //   height: 200,
                    // ),
                  )),
              const SizedBox(
                width: 5,
              ),
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
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: ListTile(
                        title: Text("Vision in White",
                            style: TextStyle(color: Color(0xff34D399))),
                        subtitle: Text(
                          "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff065F46)),
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, right: 4, left: 4),
                      child: Row(
                        children: [
                          Text("❤❤"),
                          Spacer(),
                          Text("Novel, Romance ",
                              style: TextStyle(color: Color(0xff065F46))),
                        ],
                      ),
                    )
                  ],
                ),
              ).onTap(
                () {},
              )
            ],
          )),
        ],
      ));
}

Widget display1InHomePageUpTopRated({
  required BookListResponse booksResponse,
}) {
  return SizedBox(
      height: 190,
      child: ListView.separated(
        //itemCount: 30,
        itemCount: booksResponse.books.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          print(index);
          return SizedBox(
            width: 10,
          );
        },
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              height: 200,
              child: Image.network(
                height: 200,
                booksResponse.books[index.toInt()].image!,
              ),
            ).onTap(() {
              Get.to(ScreenBook(
                book: booksResponse.books[index],
                evaluation: booksResponse.books[index].evaluation!,
                idBook: booksResponse.books[index].id.toString(),
                pathPdf: booksResponse.books[index.toInt()!!].lastName!,
                pathImage: booksResponse.books[index.toInt()!!].image!,
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
                          style: TextStyle(color: Color(0xff34D399))),
                      subtitle: Text(
                        booksResponse.books[index].description!,

                        // "$description",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff065F46)),
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.0, right: 4, left: 4),
                    child: Container(
                      height: 20,
                      child: Row(
                        children: [
                          Text("❤❤"),
                          Spacer(),
                          Text("Novel, Romance ",
                              style: TextStyle(color: Color(0xff065F46))),
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
      ));
}
//                        "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",

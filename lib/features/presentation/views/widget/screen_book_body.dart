import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/cubit/cubit6/my_library_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit6/my_library_state.dart';
import 'package:culturalspacelibrary/features/presentation/views/viwe_pdf.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ScreenBookBody extends StatelessWidget {
  final String pathImage;
  final String pathPdf;
  final String id;
  final Books book;
  final dynamic evaluation;
  const ScreenBookBody({
    Key? key,
    required this.pathImage,
    required this.pathPdf,
    required this.id,
    required this.evaluation,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyLibraryCubit(),
      child: BlocConsumer<MyLibraryCubit, MyLibraryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var addMyLibrary = MyLibraryCubit.get(context);

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
                child: Column(children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,

                          image: NetworkImage(pathImage),

                          ///   image: AssetImage(pathImage),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Card(
                          color: Colors.transparent,
                          shape: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_sharp,
                                color: Colors.white),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      child: Row(children: [
                        SizedBox(
                          child: ListTile(
                            title: Text("${book.firstName}",
                                style: TextStyle(
                                    color: Color(0xff22C55E), fontSize: 18)),
                            subtitle: Text("by NoraRoberts",
                                style: TextStyle(
                                    color: Color(0xff22C55E), fontSize: 16)),
                          ),
                          width: MediaQuery.of(context).size.width / 1.5,
                        ),
                        InkWell(
                            onTap: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      // title: const Text('رسالة منبثقة'),
                                      title: Container(
                                        child: SizedBox(
                                          height: 100,
                                          width: double.infinity,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: book.evaluation
                                                      .toDouble(),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 2.0),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        70),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .green, // <-- تغيير اللون هنا
                                                              width:
                                                                  2, // <-- يمكنك تغيير عرض الحد أيضًا
                                                            )),
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 6,
                                                            horizontal: 20),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 34),
                                                    labelStyle: const TextStyle(
                                                        // decorationColor: Colors.white,
                                                        //decoration: TextDecoration.underline,
                                                        color: Colors.black38,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 13),
                                                    labelText: "enter please ",
                                                    hoverColor: Colors.white,
                                                    focusColor: Colors.white,
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50), //
                                                      borderSide: BorderSide(
                                                          color: Colors.green),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      decorationColor:
                                                          Colors.red),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      content:
                                          Text("قيم و ادخل شرح التقييم   "),
                                      //   content: const Text('هذه الرسالة المنبثقة ستختفي بعد ثوانٍ قليلة'),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('ok'),
                                        )
                                      ],
                                    );
                                  },
                                ),
                            child: Container(
                              color: Colors.yellow,
                              child: Text(
                                "قيم هذا الكتاب",
                                style: TextStyle(
                                    color: Color(0xff22C55E), fontSize: 16),
                              ),
                            )),
                        // Spacer(),
                      ]),
                    ),
                  ),
                  Column(
                    children: [
                      ///   مشان نوقف خاصية الضغط
                      IgnorePointer(
                        ignoring: true,
                        child: SizedBox(
                          height: 40,
                          child: RatingBar.builder(
                            initialRating: book.evaluation.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 6,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                        child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: const Text("Novel, Romance",
                                  style: TextStyle(
                                      color: Color(0xff475569),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900))
                              .center(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: const Text("Reading Time 3.5H",
                                  style: TextStyle(
                                      color: Color(0xff475569),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900))
                              .center(),
                        ),
                      ],
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Center(
                        child: Text(
                      "Summruy",
                      style: TextStyle(
                          color: Color(0xff22C55E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                  const Divider(color: Color(0xff22C55E)),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                      left: 15,
                      top: 5,
                    ),
                    child: SizedBox(
                        child: const Text(
                            "After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                        width: double.infinity,
                        height: 180),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Container(
                        child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              child: const Image(
                                  image: AssetImage(
                                "assets/images/Path 66.png",
                              )),
                              onTap: () {},
                            ),
                            const Positioned(
                              top: 25,
                              left: 25,
                              child: Image(
                                  image: AssetImage(
                                    "assets/images/Path 65.png",
                                  ),
                                  height: 50,
                                  width: 75),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            print("$id");
                            addMyLibrary.addToMyLibrary(
                                context: context, id: id);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              width: 100,
                              child: Text("Library",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff22C55E))),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // وضع العناصر في وسط الصف بالطول
                              mainAxisSize: MainAxisSize
                                  .min, // جعل العناصر تأخذ نفس الارتفاع
                              children: [
                                Container(
                                  child: const Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("read",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff22C55E))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: 50,
                                    width: 75,
                                    child: IconButton(
                                      onPressed: () async {
                                        // await Get.to(() => MyViewPdf());
                                        await Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return MyViewPdf(
                                              path1: pathPdf,
                                              //  path1: "assets/pdf/WA0000.pdf",
                                            );
                                          },
                                        ));
                                      },
                                      icon: const Icon(Icons.menu_book,
                                          size: 50, color: Color(0xff22C55E)),
                                    ))
                              ]),
                        ),
                      ],
                    )),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

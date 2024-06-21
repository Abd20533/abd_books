import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:culturalspacelibrary/constant/widgetes/widgetes.dart';
import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/cubit/cubit8/novels_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit8/state_novels.dart';
import 'package:culturalspacelibrary/features/presentation/views/fantasy.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NovelsBody extends StatefulWidget {
  final String qType;
  const NovelsBody({super.key, required this.qType});

  @override
  State<NovelsBody> createState() => _NovelsBodyState();
}

class _NovelsBodyState extends State<NovelsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NovelsCubit()
        ..getBooksCategories(context: context, qType: widget.qType),
      child: BlocConsumer<NovelsCubit, NovelsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var novels = NovelsCubit.get(context);
          if (state is NovelsStateSuccessState) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                  child: Scaffold(
                      key: novels.scaffoldKeyInNovelsBody,
                      appBar: myAppBarInNovelsBody(
                          scaffoldKey1: novels.scaffoldKeyInNovelsBody),
                      endDrawer: displayEndDrawer(
                          scaffoldKey1: novels.scaffoldKeyInNovelsBody),
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    children: [
                                      buildSizeBox(),
                                      ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) =>
                                            bookNovelsInNovelsBody(
                                                idFantasy: novels
                                                    .bookListResponse!
                                                    .novels[index]
                                                    .categoryId
                                                    .toString(),
                                                pathImage: novels
                                                    .bookListResponse!
                                                    .novels[index]
                                                    .image,
                                                index: index,
                                                authorName: novels
                                                    .bookListResponse!
                                                    .novels[index]
                                                    .name),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 20,
                                        ),
                                        itemCount: novels
                                            .bookListResponse!.novels.length,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            );
          }
          if (state is NovelsStateLoadingState) {
            return CircularProgressIndicator();
          }
          return CircularProgressIndicator(
            color: Colors.red,
          );
        },
      ),
    );
  }

  Widget bookNovelsInNovelsBody(
      {required int index,
      required String authorName,
      required String idFantasy,
      required String pathImage}) {
    return SizedBox(
      height: 130,
      child: Card(
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.greenAccent,
        margin: const EdgeInsets.all(16.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 75,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(pathImage),
                  ),
                  // width: 90,
                  // height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: kColorTextFromScreenLogin.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 8.0),
                SizedBox(
                  width: 130,
                  child: Text(
                    authorName,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff34D399),
                      fontWeight: FontWeight.w500,
                    ),
                  ).center(),
                ).center(),
                const Spacer(),
                Icon(
                  Icons.favorite,
                  color: AssetsData.colorfavorite[index] == true
                      ? Colors.red
                      : Colors.white,
                ).onTap(() {
                  setState(() {
                    AssetsData.colorfavorite[index] =
                        AssetsData.colorfavorite[index] == false ? true : false;
                  });
                })
              ],
            ),
          ),
        ),
      ).onTap(() {
        Get.to(Fantasy(
          idFantasy: idFantasy,
        ));
        //
      }),
    );
  }

  Widget buildSizeBox() => const SizedBox(
        height: 5,
      );

  AppBar myAppBarInNovelsBody(
      {required GlobalKey<ScaffoldState> scaffoldKey1}) {
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
      title: const Text(
        "Novels",
        style: TextStyle(color: Color(0xff34D399), fontSize: 18),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_sharp,
            color: Color(0xff34D399),
            size: 30,
          ),
        ),
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
}

/// to do decoration: BoxDecoration gradient: LinearGradient
//                        decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment
//                                 .topLeft, // البداية من الزاوية العليا اليسرى
//                             end: Alignment
//                                 .bottomRight, // النهاية في الزاوية السفلى اليمنى
//
//                             // tileMode: TileMode.clamp,
//                             // transform: ,
//
//                             // نقطة التوقف في النصف لتقسيم الصفحة بالتساوي
//                             colors: [
//                               Colors
//                                   .greenAccent, // اللون الأول للنصف الأول من الصفحة
//                               Colors.white,
//                               Colors.greenAccent,
//                               kcolor // اللون الثاني للنصف الثاني من الصفحة
//                             ],
//                           ),
//                         ),

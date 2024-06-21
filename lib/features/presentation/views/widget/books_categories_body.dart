import 'package:culturalspacelibrary/cubit/cubit3/books_categories_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit3/state_books_categories_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/get.dart';

class BooksCategoriesBody extends StatefulWidget {
  BooksCategoriesBody({Key? key}) : super(key: key);

  @override
  State<BooksCategoriesBody> createState() => _BooksCategoriesBodyState();
}

class _BooksCategoriesBodyState extends State<BooksCategoriesBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BooksCategoriesCubit()..getBooksCategories(context: context),
      child: BlocConsumer<BooksCategoriesCubit, BooksCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bookCategories = BooksCategoriesCubit.get(context);
          if (state is BooksCategoriesSuccessState) {
            print(BooksCategoriesSuccessState);
            print(bookCategories.categoriesList1!.categories.length);
            return Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
              child: SafeArea(
                child: Scaffold(
                    key: bookCategories.scaffoldKey,
                    //_scaffoldKey,
                    appBar: myAppBar(scaffoldKey1: bookCategories.scaffoldKey),
                    endDrawer: displayEndDrawer(
                        scaffoldKey1: bookCategories.scaffoldKey),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                color:
                                    kColorTextFromScreenLogin.withOpacity(0.5),
                                child: Column(
                                  children: [
                                    buildSizeBox(),
                                    ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          bookNovelsInBooksCategoriesBody(
                                              qType: bookCategories
                                                  .categoriesList1!
                                                  .categories[index]
                                                  .id
                                                  .toString(),
                                              pathImage: bookCategories
                                                  .categoriesList1!
                                                  .categories[index]
                                                  .image,
                                              index: index,
                                              authorName: bookCategories
                                                  .categoriesList1!
                                                  .categories[index]
                                                  .name),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 20,
                                      ),
                                      itemCount: bookCategories
                                          .categoriesList1!.categories.length,
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
            );
          }

          if (state is BooksCategoriesLoadingState) {
            return CircularProgressIndicator().center();
          }
          return CircularProgressIndicator(
            color: Colors.red,
          ).center();
        },
      ),
    );
  }

  Widget bookNovelsInBooksCategoriesBody(
      {required int index,
      required String pathImage,
      required String qType,
      required String authorName}) {
    return Container(
      decoration: BoxDecoration(
          // color: kcolor,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                //
                blurRadius: 40,
                //
                color: Colors.grey.withOpacity(0.2),
                //
                spreadRadius: 0,
                offset: const Offset(10, 10))
          ]),
      child: Card(
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(40)),
        // color: kcolor,
        elevation: 10.0,
        shadowColor: Colors.greenAccent,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(pathImage),
                //    AssetImage("assets/images/Screenshot2.jpg")
              ),
              // Image.asset(AssetsData.imageBookNovels, width: 85, height: 100),
              const SizedBox(width: 12.0),
              Container(
                width: 120,
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
              ),
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
      Get.to(Novels(
        qType: qType,
      ));
      //
    });
  }

  Widget buildSizeBox() => const SizedBox(
        height: 5,
      );
}
// decoration: BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment
//         .topLeft, // البداية من الزاوية العليا اليسرى
//     end: Alignment
//         .bottomRight, // النهاية في الزاوية السفلى اليمنى
//
//     // tileMode: TileMode.clamp,
//     // transform: ,
//
//     // نقطة التوقف في النصف لتقسيم الصفحة بالتساوي
//     colors: [
//       Colors
//           .greenAccent, // اللون الأول للنصف الأول من الصفحة
//       Colors.white,
//       Colors.greenAccent,
//       kcolor // اللون الثاني للنصف الثاني من الصفحة
//     ],
//   ),
// ),

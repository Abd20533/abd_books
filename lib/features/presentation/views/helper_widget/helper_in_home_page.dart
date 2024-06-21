import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:culturalspacelibrary/constant/constant.dart';
import 'package:culturalspacelibrary/core/extentions.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_cubit.dart';
import 'package:culturalspacelibrary/cubit/cubit1/user_state.dart';
import 'package:culturalspacelibrary/cubit/cubit2/home_cubit.dart';
import 'package:culturalspacelibrary/features/presentation/views/authors.dart';
import 'package:culturalspacelibrary/features/presentation/views/books_categories.dart';
import 'package:culturalspacelibrary/features/presentation/views/home_page.dart';
import 'package:culturalspacelibrary/features/presentation/views/my_library.dart';
import 'package:culturalspacelibrary/features/presentation/views/myprofile.dart';
import 'package:culturalspacelibrary/features/presentation/views/uesres.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/pages_tabbar_home.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/screen_book_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/stting_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/time_display_body.dart';
import 'package:culturalspacelibrary/features/presentation/views/widget/users_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

final items = <CurvedNavigationBarItem>[
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.home,
    size: 30,
  )),
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.search,
    size: 30,
  )),
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.favorite,
    size: 30,
  )),
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.person,
    size: 30,
  )),
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.comment,
    size: 30,
  )),
  const CurvedNavigationBarItem(
      child: Icon(
    Icons.settings,
    size: 30,
  )),
];

Widget home1({required context}) {
  //state is WeatherLoading
  return BlocProvider(
    ///mahmoud
    create: (context) => HomeCubit()..getHome1(context: context),
    child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var home1 = HomeCubit.get(context);

        //Home1SuccessState

        return Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0),
                  child: Card(
                    color: kcolor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.green.withOpacity(0.5), width: 2)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          child: TabBar(
                              isScrollable: true, // لتمكين التمرير الأفقي

                              indicatorColor: kColorTextScreenLogin,
                              indicatorWeight: 2,
                              indicator: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: kColorDisplay2InHomePage
                                          .withOpacity(0.5),

                                      ///3
                                      spreadRadius: 3,
                                      offset: const Offset(0, 0),

                                      ///2
                                      blurRadius: 2),
                                ],
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: const Border(
                                    left: BorderSide(
                                        width: 2, color: Colors.transparent),
                                    top: BorderSide(
                                        width: 2, color: Colors.transparent),
                                    right: BorderSide(
                                        width: 2, color: Colors.transparent),
                                    bottom: BorderSide(
                                        width: 2, color: Colors.transparent)),
                              ),
                              labelColor: kColorTextScreenLogin,
                              //unselectedLabelColor: Colors.black,
                              unselectedLabelStyle: const TextStyle(
                                  fontSize: 17, color: Colors.black),
                              labelStyle: const TextStyle(fontSize: 24),
                              tabs: const [
                                Tab(text: '  All  '),
                                Tab(text: '  Recommended  '),
                                Tab(text: '  Popular Books  '),
                                Tab(text: ' My Library '),
                              ]),
                        ),
                      ],
                    ),
                  ),
                )),
            if (state is Home1SuccessState)
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 2),
                child: SizedBox(
                  height: 200,
                  child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2,
                        )),
                    child: TabBarView(
                      children: [
                        display1InHomePageUpTopRated(
                          booksResponse: home1.booksList1!,
                        ),
                        display1InHomePageUpTopRated(
                          booksResponse: home1.booksList1!,
                        ),
                        display1InHomePageUpTopRated(
                          booksResponse: home1.booksList1!,
                        ),
                        display1InHomePageUpTopRated(
                          booksResponse: home1.booksList1!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (state is Home1LoadingState)
              Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CircularProgressIndicator().center()),
            if (state is Home1ErrorState)
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  "error data",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ).center(),
              ),
          ],
        );
      },
    ),
  );
}

Widget cardStack() {
  return BlocProvider(
    create: (context) => HomeCubit()..getHome2(context: context),
    child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var home2 = HomeCubit.get(context);
        if (state is Home2SuccessState) {
          return ListView.separated(
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      home2.categoriesList1!.categories[index].image!,
                    ),
                    fit: BoxFit.fill,
                    // fit: BoxFit.contain,
                  ),
                  border: BorderDirectional(),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: 160,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    child: Text(home2.categoriesList1!.categories[index].name)
                        .center(),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    height: 20,
                  ).center(),
                ],
              ),
            ).onTap(() {
              Get.to(const BooksCategories());
            }),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: home2.categoriesList1!.categories.length,
          );
        }
        if (state is Home2LoadingState) {
          return Container(child: CircularProgressIndicator().center());
        }

        return Container(
            child: CircularProgressIndicator(
          color: Colors.red,
        ).center());
      },
    ),
  );
}

Widget cardStackToImage() {
  return BlocProvider(
    create: (context) => HomeCubit()..getHome4(context: context),
    child: BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var home4 = HomeCubit.get(context);

        if (state is Home4SuccessState) {
          print(" home4.authorResponseList1.author.length" +
              "${home4.authorResponseList1!.authors.length}");
          return ListView.separated(
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  color: Color(0xff34d399).withOpacity(0.8),
                  border: BorderDirectional(),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: 160,
              height: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -35,
                    right: 40,
                    child: Container(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            home4.authorResponseList1!.authors[index].image),
                        //AssetImage("assets/images/download.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(home4.authorResponseList1!.authors[index]
                                  .hisUniversity)
                              .center(),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 12),
                              child: Container(
                                child: Text("English").center(),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(1)),
                                height: 20,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10),
                              child: Container(
                                child: Text("British").center(),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(1)),
                                height: 20,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ).onTap(() {
              Get.to(const Authors());
            }),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: home4.authorResponseList1!.authors.length,
            // itemCount: home4.authorResponseList1!.author.length,
          );
        }
        if (state is Home4LoadingState) {
          return Container(child: CircularProgressIndicator().center());
        }

        return Container(
            child: CircularProgressIndicator(
          color: Colors.red,
        ).center());
      },
    ),
  );
}

Widget topBar() {
  return Row(children: [
    const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        "Welcome User,",
        style: TextStyle(color: Color(0xff34D399), fontSize: 22),
      ),
    ),
    const Spacer(),
    IconButton(
      onPressed: () {
        //Get.to(AbdPdfTest());
      },
      icon: const Icon(
        Icons.search_sharp,
        color: Color(0xff34D399),
        size: 30,
      ),
    ),
    IconButton(
      onPressed: () {
        print(CashHelper.getUserToken()!);
      },
      icon: const Icon(
        Icons.menu_book_rounded,
        color: Color(0xff34D399),
        size: 30,
      ),
    )
  ]);
}

Widget makeStackAndContainerAndTextInHomePage({required double height}) {
  return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  //
                  blurRadius: 40,
                  //
                  color: Colors.grey.withOpacity(0.2),
                  //
                  spreadRadius: 0,
                  offset: const Offset(10, 10))
            ]),
            child: Container(
              color: Color(0xff34d399).withOpacity(0.1),
              //const Color(0xff34D399),
              width: double.infinity,
              height: height,
              // (MediaQuery.of(context).size.height / 5),
              child: Card(
                  color: const Color(0xff34D399).withOpacity(0.8),
                  elevation: 15,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bookshelf",
                              //  ' 700' r'$',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 75,
                                height: 65,
                                child: Image.asset("assets/images/abd4.png",
                                    //AssetsData.imageFlower,
                                    width: 75,
                                    height: 50)),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Positioned(
            height: 140,
            right: -20,
            top: -40,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                //border: Border(),
                //    borderRadius: BorderRadius.circular(200),
              ),
              child: CircleAvatar(
                backgroundColor: Color(0xff34d399).withOpacity(0.0),
                //Colors.white,
                radius: 75,
                child: Image.asset("assets/images/abd3.png",
                    //AssetsData.imageSplashViewBody,
                    width: 175,
                    height: 175),
              ),
            ),
          ),
          Positioned(
            right: -30,
            top: 70,
            child: Container(
                width: 100,
                height: 100,
                child: const Image(
                    image: AssetImage(
                      AssetsData.imageFlower,
                    ),
                    width: 75,
                    height: 60)),
          ),
        ],
      ));
}

///   display2InHomePage
// Widget display2InHomePageInTopRated() {
//   return SizedBox(
//       height: 200,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A1.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A2.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A3.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A4.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A1.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A2.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A3.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A4.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//           myContainerInDisplay2InHomePage(
//               evaluation: 2,
//               nameImage: 'assets/images/A1.png',
//               nameText2: "Harry Potter",
//               nameText: "novel, fantasy"),
//           MyVerticalDividerInHomePage(),
//         ],
//       ));
// }

Widget display1InHomePage() {
  return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              child: Row(
            children: [
              Container(
                child: Image.asset(
                  height: 200,
                  "assets/images/1.png",
                ),
              ),
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
                height: 200,
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
                          maxLines: 8,
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
              )
            ],
          )),
          const VerticalDivider(
              width: 4,
              indent: 10,
              endIndent: 10,
              thickness: 3,
              color: Color(0xff34D399)),
          Container(
            height: 200,
            child: Image.asset(
              height: 200,
              "assets/images/Scroll Group 8.png",
            ),
          ),
        ],
      ));
}

Widget MyVerticalDividerInHomePage() {
  return const Padding(
    padding: EdgeInsets.only(left: 4.0, right: 4),
    child: VerticalDivider(
        indent: 10,
        endIndent: 40,
        width: 4,
        thickness: 3,
        color: Color(0xff34D399)),
  );
}

Widget myContainerInDisplay2InHomePage(
    {required String nameImage,
    required String nameText,
    required double evaluation,
    required Books book,
    String? pdfPath,
    required String nameText2}) {
  return SizedBox(
    height: 180,
    child: Column(children: [
      Container(
        width: 120,
        height: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(nameImage),
            // image: AssetImage(nameImage),
          ),
        ),
      ).onTap(() {
        print(pdfPath);
        Get.to(ScreenBookBody(
                book: book,
                evaluation: evaluation,
                pathImage: nameImage,
                pathPdf: pdfPath!,
                id: "1")
            //     ScreenBook(
            //   idBook: "2",
            //   pathPdf: pdfPath,
            //   pathImage: nameImage,
            // )
            );
      }),
      Text(
        nameText,
        style: const TextStyle(color: kColorDisplay2InHomePage),
      ).center(),
      const Spacer(),
      Text(nameText2),
    ]),
  );
}

Widget displayEndDrawerInHomePage(
    {required GlobalKey<ScaffoldState> scaffoldKey}) {
  return Drawer(
    width: 220,
    child: BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var drawer = UserCubit.get(context);

          return ListView(
            children: <Widget>[
              Row(children: [
                IconButton(
                  onPressed: () {
                    // setState(() {
                    scaffoldKey.currentState!.closeEndDrawer();
                    // لفتح الـ endDrawer
                    //}
                    // );
                  },
                  icon: const Icon(Icons.more_horiz_outlined, size: 30),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 35,
                  // AssetsData.imageSplashViewBody
                  backgroundImage: AssetImage("assets/images/Screenshot1.jpg"),
                )
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 50),
                      child: ListTile(
                        title: const Text(
                          'Profile',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.person_rounded,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const MyProfile());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 100),
                      child: ListTile(
                        title: const Text(
                          'My Library',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.menu_book_sharp,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(MyLibrary(pathImage: ""));

                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 150),
                      child: ListTile(
                        title: const Text(
                          'Home',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.home,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const HomePage());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 200),
                      child: ListTile(
                        title: const Text(
                          'Books Categories',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.menu_book_outlined,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const BooksCategories());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 250),
                      child: ListTile(
                        title: const Text(
                          'Authores',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.water_damage_outlined,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const Authors());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 200),
                      child: ListTile(
                        title: const Text(
                          'Books Categories',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        leading: const Icon(
                          Icons.menu_book_outlined,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const BooksCategories());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 300),
                      child: ListTile(
                        title: const Text(
                          'Uesrs',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 19),
                        ),
                        leading: const Icon(
                          Icons.person,
                          color: Color(0xff34D399),
                        ),
                        onTap: () {
                          Get.to(const Users());
                          // Handle item 2 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 350),
                      child: ListTile(
                        title: const Text(
                          'LogOut',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ).onTap(() {
                          drawer.logout(context: context);
                          // Get.off(
                          //       () => const ScreenLogin(),
                          //   //       transition: Transition.downToUp,
                          //   duration: const Duration(seconds: 1),
                          // );
                        }),
                        leading: const Icon(
                          Icons.login_outlined,
                          color: Color(0xff34D399),
                        ),
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 400),
                      child: ListTile(
                        leading: const Icon(
                          Icons.dark_mode,
                          color: Color(0xff34D399),
                        ),
                        title: const Text(
                          'Dark Mode',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        onTap: () {
                          Get.to(const SettingsBody());
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 450),
                      child: ListTile(
                        leading: const Icon(
                          Icons.access_time_outlined,
                          color: Color(0xff34D399),
                        ),
                        title: const Text(
                          'Pace',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        onTap: () {
                          Get.to(TimeDisplay1());
                          // Handle item 1 tap
                        },
                      ),
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 500),
                      child: ListTile(
                        leading: const Icon(
                          Icons.exit_to_app,
                          color: Color(0xff34D399),
                        ),
                        title: const Text(
                          'Exst',
                          style:
                              TextStyle(color: Color(0xff34D399), fontSize: 22),
                        ),
                        onTap: () {
                          exit(0);

                          // Handle item 1 tap
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

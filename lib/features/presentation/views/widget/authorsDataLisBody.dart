import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_authors.dart';
import 'package:flutter/widgets.dart';

class AuthorsDataListBody extends StatelessWidget {
  final Author authors;
  const AuthorsDataListBody({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKeyInAuthorsDataListBody =
        GlobalKey<ScaffoldState>();
    // TODO: implement build
    return Scaffold(
      key: scaffoldKeyInAuthorsDataListBody,
      appBar: myAppBarInAuthorsBody(
          scaffoldKey1: scaffoldKeyInAuthorsDataListBody,
          title: "Authors Detalist"),
      body: Container(
          child: Column(children: [
        SizedBox(
          height: 1 / 4 * MediaQuery.of(context).size.height / 1.5,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 30),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(authors.image),
                ),
              ),
              Text(
                authors.name,
                style: headline1,
              )
            ],
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green, width: 2)),
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TabBar(
                          isScrollable: true, // لتمكين التمرير الأفقي

                          indicatorColor: kColorTextScreenLogin,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      kColorDisplay2InHomePage.withOpacity(0.5),
                                  spreadRadius: 3,
                                  offset: const Offset(0, 0),
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
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 40.0),
                          tabs: const [
                            Tab(
                              // icon: Icon(Icons.book_online_outlined),
                              text: "Info",
                            ),
                            Tab(
                              text: "Books",
                            ),
                          ]),
                    ),
                    const Divider(
                      color: Color(0xff4ADE80),
                      thickness: 3,
                    ),
                    Expanded(
                        child: TabBarView(
                      children: [
                        InfoInTabInAuthorsDataListBody(
                            born: authors.birthDay.toString(),
                            information: authors.aboutIt,
                            birthPlace: authors.from,
                            context: context),
                        booksInTabBar2InAuthorsDataListBody(
                          id: authors.id.toString(),
                          // id: authors.id.toString(),
                          height: MediaQuery.of(context).size.height / 1.5,
                        ),
                        // booksInTabBar2InAuthorsDataListBody(
                        //   height: MediaQuery.of(context).size.height / 1.5,
                        // ),
                      ],
                    ))
                  ],
                ),
              ),
            )),
      ])),
      endDrawer: displayEndDrawerInHomePage(
          scaffoldKey: scaffoldKeyInAuthorsDataListBody),
    );
  }
}

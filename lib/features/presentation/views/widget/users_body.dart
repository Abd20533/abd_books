import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../import_package.dart';

class UsersBody extends StatefulWidget {
  const UsersBody({super.key});

  @override
  State<UsersBody> createState() => _UsersBodyState();
}

class _UsersBodyState extends State<UsersBody> {
  final GlobalKey<ScaffoldState> scaffoldKeyUsersBody =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKeyUsersBody,
      drawer: displayEndDrawerInHomePage(scaffoldKey: scaffoldKeyUsersBody),
      endDrawer: displayEndDrawerInHomePage(scaffoldKey: scaffoldKeyUsersBody),
      appBar: myAppBarInAuthorsBody(
          scaffoldKey1: scaffoldKeyUsersBody, title: "Users "),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  color: kColorTextFromScreenLogin.withOpacity(0.5),
                  child: Column(
                    children: [
                      buildSizeBox(),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              allComments(index: index),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //AppBar(title: Text("Comments"),),
    ));
  }

  Widget allComments({required int index}
      // required String? pathImage,
      // required String? qType,
      // required String? authorName}
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        height: MediaQuery.of(context).size.height / 7,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent.withOpacity(0.2),
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/jk.jpg"),
                  ).onTap(() {
                    print("object");
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Text(
                        "Abdalrhman $index",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff34D399),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildSizeBox() => const SizedBox(
        height: 5,
      );
}

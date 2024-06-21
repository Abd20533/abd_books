import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../import_package.dart';

class CommentsBody extends StatefulWidget {
  const CommentsBody({super.key});

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  final GlobalKey<ScaffoldState> scaffoldKeyCommentsBody =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scaffoldKeyCommentsBody,
      drawer: displayEndDrawerInHomePage(scaffoldKey: scaffoldKeyCommentsBody),
      endDrawer:
          displayEndDrawerInHomePage(scaffoldKey: scaffoldKeyCommentsBody),
      appBar: myAppBarInAuthorsBody(
          scaffoldKey1: scaffoldKeyCommentsBody, title: "CommentsBody"),
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
                CircleAvatar(
                  backgroundColor: Colors.greenAccent.withOpacity(0.2),
                  radius: 50,
                  child: Icon(
                    size: 40,
                    Icons.comment_bank,
                    color: Colors.green,
                  ),
                ).onTap(() {
                  print("object");
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "My  Comments $index",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff34D399),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "date is 2024/5/ $index",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 13.0,
                          //color: Color(0xff34D399),
                          fontWeight: FontWeight.w500,
                        ),
                      )
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

//      Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height / 2,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/Screenshot2.jpg"))),
//             child: Container(
//               height: 160,
//               width: MediaQuery.of(context).size.height - 20,
//               child: Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Align(
//                           alignment: Alignment.topCenter,
//                           child: CircleAvatar(
//                               radius: 35,
//                               // backgroundColor: Colors.white,
//                               child: Icon(
//                                 Icons.comment,
//                                 color: Color(0xff34D399),
//                               )),
//                         ),
//                         Spacer(),
//                         Text(
//                           "My  Comments $index",
//                           overflow: TextOverflow.clip,
//                           maxLines: 1,
//                           style: const TextStyle(
//                             fontSize: 20.0,
//                             color: Color(0xff34D399),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Text(
//                           "My  Comments $index",
//                           overflow: TextOverflow.clip,
//                           maxLines: 1,
//                           style: const TextStyle(
//                             fontSize: 20.0,
//                             color: Color(0xff34D399),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
/// Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.width / 2 + 50,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.fill,
//           image: AssetImage('assets/images/Screenshot2.jpg'),
//         ),
//         borderRadius: BorderRadius.circular(60),
//       ),
//       child: Container(
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.white,
//               child: Icon(
//                 Icons.comment,
//                 color: Color(0xff34D399),
//               ),
//             ),
//             Row(
//               children: [
//                 const SizedBox(width: 12.0),
//                 Column(
//                   children: [
//                     Container(
//                       width: 180,
//                       height: 50,
//                       child: Text(
//                         "My  Comments $index",
//                         overflow: TextOverflow.clip,
//                         maxLines: 1,
//                         style: const TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ).center(),
//                     ),
//                     SizedBox(
//                       height: (MediaQuery.of(context).size.width / 2) / 2 - 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                       child: Container(
//                         height: 20,
//                         width: 180,
//                         child: Text(
//                           "Date is 2003/5/ $index",
//                           overflow: TextOverflow.clip,
//                           maxLines: 1,
//                           style: TextStyle(
//                             fontSize: 12.0,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ).center(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       //Row(children: [],)
//     ).onTap(() {
//       // Get.to(Novels(
//       //   qType: qType,
//       // ));
//       //
//     });

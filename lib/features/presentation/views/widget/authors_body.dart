import 'package:culturalspacelibrary/cubit/cubit5/auther_cubit_body.dart';
import 'package:culturalspacelibrary/cubit/cubit5/state_authors_body.dart';
import 'package:culturalspacelibrary/import_package.dart';
import 'package:get/get.dart';

import '../../../../modules_dio/module_authors.dart';

class AuthorsBody extends StatelessWidget {
  const AuthorsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorsBodyCubit()..getHome4(context: context),
      child: BlocConsumer<AuthorsBodyCubit, AuthorsBodyState>(
        listener: (context, state) {},
        builder: (context, state) {
          print("object");
          var authors = AuthorsBodyCubit.get(context);
          if (state is AuthorsBodySuccessState) {
            return Scaffold(
              key: authors.scaffoldKeyInAuthorsBody,
              appBar: myAppBarInAuthorsBody(
                  scaffoldKey1: authors.scaffoldKeyInAuthorsBody,
                  title: "Authors"),
              endDrawer: displayEndDrawer(
                  scaffoldKey1: authors.scaffoldKeyInAuthorsBody),
              body: Padding(
                padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            color: const Color(0xffF1F5F9),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      cardInAuthorsBody(
                                          author: authors.authorResponseList123!
                                              .authors[index],
                                          name: authors.authorResponseList123!
                                              .authors[index].name,
                                          About_It: authors
                                              .authorResponseList123!
                                              .authors[index]
                                              .aboutIt,
                                          pathImage: authors
                                              .authorResponseList123!
                                              .authors[index]
                                              .image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              30),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: authors
                                      .authorResponseList123!.authors.length,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          }
          return CircularProgressIndicator().center();
        },
      ),
    );
  }

  Widget cardInAuthorsBody(
      {required double width,
      required String pathImage,
      required String name,
      required String About_It,
      required Author author}) {
    return SizedBox(
      width: width,
      height: 120,
      child: Card(
        shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(35)),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 110,
              width: width / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  image: NetworkImage(
                    pathImage,
                  ),

                  //  image: AssetImage("assets/images/download.png")
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      name,
                      //"JK rowling",
                      style: TextStyle(color: Color(0xff34D399), fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    // width: (width / 3.5) * 2,
                    child: Text(
                      maxLines: 4,
                      About_It,
                      //"J. K. Rowling, is a British author and philanthropist. She wrote Harry Potter, a seven-volume fantasy series published from 1997 to 2007...",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          //color:
                          //Color(0xff34D399)
                          fontSize: 12),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    ).onTap(() {
      Get.to(AuthorsDataLis(
        author: author,
      ));
    });
  }
}

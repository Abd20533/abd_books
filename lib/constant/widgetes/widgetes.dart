import 'package:culturalspacelibrary/import_package.dart';
import 'package:culturalspacelibrary/modules_dio/module_book.dart';

import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

void showSnackBar(
  BuildContext context, {
  required String text,
}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.black.withOpacity(0.5),
    content: Text(text),
    duration: Duration(seconds: 3),
    // width: 100,
    shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(100),
        gapPadding: 40),
    elevation: 10,
    clipBehavior: Clip.antiAlias,
    showCloseIcon: true,
    padding: EdgeInsets.all(10),
    action: SnackBarAction(
      onPressed: () {},
      label: "Help",
    ),
    // margin: EdgeInsets.all(20),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void myShowPopup(BuildContext context,
    {required String text, required String path, bool? T = false}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('رسالة منبثقة'),
        title: Container(
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: LottieBuilder.asset(
                path,
                repeat: true,
                reverse: true,
              ),
            ),
          ),
        ),
        content: Text("$text"),
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
  );
}

Widget onetextfromfaliedwithobTextinScreenSngUnBodyandLogin(
    {required bool obText,
    required TextEditingController Password,
    required VoidCallback callback}) {
  return TextFormField(
    obscureText: obText,
    onFieldSubmitted: (value) {},
    onChanged: (value) {},
    validator: (value) {
      return validate(value!, "password");
    },
    controller: Password,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.green, // <-- تغيير اللون هنا
            width: 2, // <-- يمكنك تغيير عرض الحد أيضًا
          )),

      suffixIconConstraints: const BoxConstraints.expand(height: 34, width: 60),

      suffixIcon: IconButton(
        icon: Icon(
          obText ? Icons.visibility_off : Icons.visibility,
          color: !obText ? Colors.blue : Colors.grey,
          size: 22,
        ),
        onPressed: callback,
      ),
      isDense: true,

      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      filled: true,
      fillColor: kColorTextFromScreenLogin.withOpacity(0.5),
      hintStyle: const TextStyle(color: Colors.green, fontSize: 34),
      labelStyle: const TextStyle(
          // decorationColor: Colors.white,
          //decoration: TextDecoration.underline,
          color: Colors.black38,
          fontWeight: FontWeight.w300,
          fontSize: 13),
      // errorText: "there are problem",
      errorStyle: TextStyle(color: Colors.red.shade300, fontSize: 10),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            color: Colors.black45,
            width: 1,
          )),
      errorMaxLines: 1,
      labelText: "Create a Password :",
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(style: BorderStyle.solid, color: Colors.white),
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}

AppBar myAppBarInFantasyBody({required GlobalKey<ScaffoldState> scaffoldKey1}) {
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
      "Fantasy",
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

AppBar myAppBarInMyProfile(
    {required GlobalKey<ScaffoldState> scaffoldKey1, required String title}) {
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
    title: Text(
      "$title",
      style: const TextStyle(color: Color(0xff34D399), fontSize: 18),
    ),
    actions: [
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

AppBar myAppBarInAuthorsBody(
    {required GlobalKey<ScaffoldState> scaffoldKey1, required String title}) {
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
    title: Text(
      title,
      style: const TextStyle(color: Color(0xff34D399), fontSize: 18),
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

Widget cardInFantasyBody({required String nameImage, required Books books}) {
  return Card(
    elevation: 10,
    shadowColor: Colors.green,
    shape:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(nameImage),
              // AssetImage(
              //     "assets/images/photo_${nameImage}_2024-03-19_14-32-09.jpg"),
            ),
          ),
        ),
        const VerticalDivider(
            indent: 10,
            endIndent: 10,
            width: 4,
            thickness: 3,
            color: Color(0xff34D399)),
        Expanded(
          child: Container(
            color: Colors.white,
            height: 200,
            // width: 205,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Container(
                    height: 138,
                    child: ListTile(
                      title: Text(books.firstName!,
                          //"Vision in White",
                          style: TextStyle(
                              color: Color(0xff34D399), fontSize: 14)),
                      subtitle: Text(
                        books.description.toString(),
                        //"After years of throwing make-believe weddings in the backyard, flowers, photography, desserts, and details are what these women do best: a guaranteed perfect, beautiful day full of memories to last the rest of your life",
                        style: TextStyle(fontSize: 8, color: Color(0xff065F46)),
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 18.0, right: 4, left: 4, bottom: 1),
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
          ),
        )
      ],
    ),
  ).onTap(() {
    Get.to(ScreenBook(
      book: books,
      evaluation: books.evaluation,
      pathPdf: books.lastName,

      idBook: books.id.toString(),
      pathImage: books.image!,
      // pathImage: "assets/images/photo_${nameImage}_2024-03-19_14-32-09.jpg",
    ));
  });
}

Widget displayEndDrawer({required GlobalKey<ScaffoldState> scaffoldKey1}) {
  return Drawer(
    backgroundColor: kcolor,
    width: 220,
    child: ListView(
      children: <Widget>[
        Row(children: [
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
                    // setState(() {
                    scaffoldKey1.currentState!
                        .closeEndDrawer(); // لفتح الـ endDrawer
                    // });
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
        ]),
        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 200),
                child: ListTile(
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
                  ),
                  leading: const Icon(
                    Icons.person_rounded,
                    color: Color(0xff34D399),
                  ),
                  onTap: () {
                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 400),
                child: ListTile(
                  title: const Text(
                    'My Library',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
                  ),
                  leading: const Icon(
                    Icons.menu_book_sharp,
                    color: Color(0xff34D399),
                  ),
                  onTap: () {
                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 600),
                child: ListTile(
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
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
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 800),
                child: ListTile(
                  title: const Text(
                    'Books Categories',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
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
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 900),
                child: ListTile(
                  title: const Text(
                    'Authores',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
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
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 1000),
                child: ListTile(
                  title: const Text(
                    'Marketplace',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 19),
                  ),
                  leading: const Icon(
                    Icons.place,
                    color: Color(0xff34D399),
                  ),
                  onTap: () {
                    // Handle item 2 tap
                  },
                ),
              ),
              FadeInUp(
                duration: const Duration(seconds: 2),
                delay: const Duration(milliseconds: 1100),
                child: ListTile(
                  title: const Text(
                    'LogOut',
                    style: TextStyle(color: Color(0xff34D399), fontSize: 22),
                  ).onTap(() {
                    Get.off(
                      () => const ScreenLogin(),
                      //   transition: Transition.downToUp,
                      duration: const Duration(seconds: 1),
                    );
                  }),
                  leading: const Icon(
                    Icons.login_outlined,
                    color: Color(0xff34D399),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

AppBar myAppBar({required GlobalKey<ScaffoldState> scaffoldKey1}) {
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
      "Books Categories",
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

Widget myText({
  required String text,
  required Color color,
  double fontSize = 20,
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize),
  );
}

Widget myTextBold({
  required String text,
  required Color color,
  double fontSize = 20,
}) {
  return Card(
    color: const Color(0xffF1F5F9),
    shadowColor: const Color(0xff34D399),
    elevation: 20,
    child: Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.normal),
    ),
  );
}

Widget mySizedBox({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget customTextFormField1({
  required TextEditingController controller,
  required TextInputType type,
  required String title,
  required IconData icon,
  required String validationType,
  required double BorderRadiusCircular,
}) {
  return TextFormField(
    validator: (value) => validate(value!, validationType),
    onFieldSubmitted: (value) async {},
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: title,
      prefixIcon: Icon(icon),
      //مشان يظهر الخط الخارجي للصندوق
      border: const OutlineInputBorder(),
    ),
  );
}

Widget customTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String title,
  IconData icon = Icons.import_export,
  required String validationType,
}) {
  return TextFormField(
    onFieldSubmitted: (value) {
      print("object");
    },
    onChanged: (value) {
      print(value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "errrrrrror";
        // throw Exception("الحقل فارغ");
      }
      return null;
    },
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.5),
      labelStyle: const TextStyle(color: Colors.white),
      labelText: title,
      isDense: true, // تعديل هنا
      contentPadding: const EdgeInsets.symmetric(
          vertical: 1.0, horizontal: 1.0), // تعديل هنا
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(style: BorderStyle.solid, color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget customTextFormField444({
  required TextEditingController controller,
  required TextInputType type,
  required String title,
  Color col = Colors.white,
  IconData icon = Icons.import_export,
  required String validationType,
  required double BorderRadiusCircular,
  //required FormFieldValidator validationType1,
}) {
  return Material(
    child: TextFormField(
      onFieldSubmitted: (value) {},
      onChanged: (value) {},
      validator: (value) {
        return validate(value!, validationType);
      },
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderRadiusCircular),
            borderSide: const BorderSide(
              color: Colors.green, // <-- تغيير اللون هنا
              width: 2, // <-- يمكنك تغيير عرض الحد أيضًا
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderRadiusCircular),
            borderSide: const BorderSide(
              color: Colors.red,
              style: BorderStyle.solid,
              width: 2, // <-- يمكنك تغيير عرض الحد أيضًا
            )),

        isDense: true,
        suffixIconColor: Colors.black,

        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        filled: true,
        fillColor: col.withOpacity(0.5),
        hintStyle: const TextStyle(color: Colors.green, fontSize: 34),
        labelStyle: const TextStyle(
            // decorationColor: Colors.white,
            //decoration: TextDecoration.underline,
            color: Colors.black38,
            fontWeight: FontWeight.w300,
            fontSize: 13),
        // errorText: "there are problem",
        errorStyle: TextStyle(color: Colors.red.shade300, fontSize: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderRadiusCircular),
            borderSide: const BorderSide(
              style: BorderStyle.none,
              color: Colors.black45,
              width: 1,
            )),
        errorMaxLines: 1,
        labelText: title,
        hoverColor: Colors.green,
        focusColor: Colors.green,

        border: OutlineInputBorder(
          borderSide:
              const BorderSide(style: BorderStyle.solid, color: Colors.white),
          borderRadius: BorderRadius.circular(BorderRadiusCircular),
        ),
      ),
    ),
  );
}
